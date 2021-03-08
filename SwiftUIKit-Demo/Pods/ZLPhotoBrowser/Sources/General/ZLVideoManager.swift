//
//  ZLVideoManager.swift
//  ZLPhotoBrowser
//
//  Created by long on 2020/9/23.
//
//  Copyright (c) 2020 Long Zhang <495181165@qq.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import UIKit
import AVFoundation

public class ZLVideoManager: NSObject {
    
    class func getVideoExportFilePath() -> String {
        let format = ZLPhotoConfiguration.default().videoExportType.format
        return NSTemporaryDirectory().appendingFormat("/%@.%@", UUID().uuidString, format)
    }
    
    @objc public class func exportEditVideo(for asset: AVAsset, range: CMTimeRange, completion: @escaping ( (URL?, Error?) -> Void )) {
        let outputUrl = URL(fileURLWithPath: self.getVideoExportFilePath())
        guard let exportSession = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetPassthrough) else {
            completion(nil, NSError(domain: "", code: -1000, userInfo: [NSLocalizedDescriptionKey: "video export failed"]))
            return
        }
        exportSession.outputURL = outputUrl
        exportSession.outputFileType = ZLPhotoConfiguration.default().videoExportType.avFileType
        exportSession.timeRange = range
        
        exportSession.exportAsynchronously(completionHandler: {
            let suc = exportSession.status == .completed
            if exportSession.status == .failed {
                zl_debugPrint("ZLPhotoBrowser: video export failed: \(exportSession.error?.localizedDescription ?? "")")
            }
            DispatchQueue.main.async {
                completion(suc ? outputUrl : nil, exportSession.error)
            }
        })
    }
    
    /// 没有针对不同分辨率视频做处理，仅用于处理相机拍照的视频
    @objc public class func mergeVideos(fileUrls: [URL], completion: @escaping ( (URL?, Error?) -> Void )) {
        let mixComposition = AVMutableComposition()
        
        let assets = fileUrls.map { AVURLAsset(url: $0) }
        
        do {
            // video track
            let compositionVideoTrack = mixComposition.addMutableTrack(withMediaType: .video, preferredTrackID: kCMPersistentTrackID_Invalid)
            
            var instructions: [AVMutableVideoCompositionInstruction] = []
            var videoSize = CGSize.zero
            var start: CMTime = .zero
            for asset in assets {
                let videoTracks = asset.tracks(withMediaType: .video)
                if let assetTrack = videoTracks.first, compositionVideoTrack != nil  {
                    try compositionVideoTrack?.insertTimeRange(CMTimeRangeMake(start: .zero, duration: asset.duration), of: assetTrack, at: start)
                    let layerInstruction = AVMutableVideoCompositionLayerInstruction(assetTrack: compositionVideoTrack!)
                    layerInstruction.setTransform(assetTrack.preferredTransform, at: start)
                    
                    let instruction = AVMutableVideoCompositionInstruction()
                    instruction.timeRange = CMTimeRangeMake(start: start, duration: asset.duration)
                    instruction.layerInstructions = [layerInstruction]
                    instructions.append(instruction)
                    
                    start = CMTimeAdd(start, asset.duration)
                    if videoSize == .zero {
                        videoSize = assetTrack.naturalSize
                        let info = self.orientationFromTransform(assetTrack.preferredTransform)
                        if info.isPortrait {
                            swap(&videoSize.width, &videoSize.height)
                        }
                    }
                }
            }
            
            
            let mainComposition = AVMutableVideoComposition()
            mainComposition.instructions = instructions
            mainComposition.frameDuration = CMTimeMake(value: 1, timescale: 30)
            mainComposition.renderSize = videoSize
            
            // audio track
            let compositionAudioTrack = mixComposition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)
            start = .zero
            for asset in assets {
                let audioTracks = asset.tracks(withMediaType: .audio)
                if !audioTracks.isEmpty {
                    try compositionAudioTrack?.insertTimeRange(CMTimeRangeMake(start: .zero, duration: asset.duration), of: audioTracks[0], at: start)
                    start = CMTimeAdd(start, asset.duration)
                }
            }
            
            guard let exportSession = AVAssetExportSession(asset: mixComposition, presetName: AVAssetExportPreset1280x720) else {
                completion(nil, NSError(domain: "", code: -1000, userInfo: [NSLocalizedDescriptionKey: "video merge failed"]))
                return
            }
            
            let outputUrl = URL(fileURLWithPath: ZLVideoManager.getVideoExportFilePath())
            exportSession.outputURL = outputUrl
            exportSession.shouldOptimizeForNetworkUse = true
            exportSession.outputFileType = ZLPhotoConfiguration.default().videoExportType.avFileType
            exportSession.videoComposition = mainComposition
            exportSession.exportAsynchronously(completionHandler: {
                let suc = exportSession.status == .completed
                if exportSession.status == .failed {
                    zl_debugPrint("ZLPhotoBrowser: video merge failed:  \(exportSession.error?.localizedDescription ?? "")")
                }
                DispatchQueue.main.async {
                    completion(suc ? outputUrl : nil, exportSession.error)
                }
            })
        } catch {
            completion(nil, error)
        }
    }
    
    static func orientationFromTransform(_ transform: CGAffineTransform) -> (orientation: UIImage.Orientation, isPortrait: Bool) {
        var assetOrientation = UIImage.Orientation.up
        var isPortrait = false
        let tfA = transform.a
        let tfB = transform.b
        let tfC = transform.c
        let tfD = transform.d
        
        if tfA == 0 && tfB == 1.0 && tfC == -1.0 && tfD == 0 {
            assetOrientation = .right
            isPortrait = true
        } else if tfA == 0 && tfB == -1.0 && tfC == 1.0 && tfD == 0 {
            assetOrientation = .left
            isPortrait = true
        } else if tfA == 1.0 && tfB == 0 && tfC == 0 && tfD == 1.0 {
            assetOrientation = .up
        } else if tfA == -1.0 && tfB == 0 && tfC == 0 && tfD == -1.0 {
            assetOrientation = .down
        }
        return (assetOrientation, isPortrait)
    }
    
}
