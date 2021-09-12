//
//  LevenshteinDistance.swift
//  DynamicProgramming
//
//  Created by ggl on 2020/8/25.
//  Copyright © 2020 ggl. All rights reserved.
//  莱文斯坦距离

import Foundation

/**
 * 两个字符串之间的相似程度如何量化？那就是编辑距离
 * 编辑距离指的是，讲一个字符串转化成另一个字符串，需要的最少编辑操作次数（比如增加一个字符、删除一个字符、替换一个字符）
 * 编辑距离越大，说明两个字符串的相似程度越小；相反，编辑距离越小，说明两个字符串的相似程度越大；
 * 对于两个完全相同的字符串来说，编辑距离就是0
 *
 * 莱文斯坦距离允许增加、删除、替换字符这是三个编辑操作，莱文斯坦距离的大小，表示两个字符串差异的大小
 */


/// 动态规划计算莱文斯坦距离
/// 状态转移方程：
/// 如果a[i] == b[j], 则 min_edist(i,j) 等于 min(min_edist(i-1, j)+1, min_edist(i, j-1)+1, min_edist(i-1, j-1))
/// 若果a[i] != b[j], 则 min_edist(i,j) 等于 min(min_edist(i-1, j)+1, min_edist(i, j-1)+1, min_edist(i-1,j-1)+1)
///
/// - Parameters:
///   - aString: 第一个字符串
///   - bString: 第二个字符串
/// - Returns: 莱文斯坦距离
func lstDistanceDP(aString: String, bString: String) -> Int {
    if aString.count == 0 {
        return bString.count
    }
    if bString.count == 0 {
        return aString.count
    }
    let aChArr = aString.compactMap { $0 }, bChArr = bString.compactMap { $0 }
    var states = [[Int]](repeating: [Int](repeating: 0, count: bChArr.count+1), count: aChArr.count+1)
    // 初始化
    for i in 0...aChArr.count {
        states[i][0] = i
    }
    for j in 0...bChArr.count {
        states[0][j] = j
    }
    
    // 计算其它数据
    for i in 1...aChArr.count {
        for j in 1...bChArr.count {
            var dis1 = states[i-1][j-1]
            let dis2 = states[i-1][j] + 1
            let dis3 = states[i][j-1] + 1
            
            if aChArr[i-1] != bChArr[j-1] {
                dis1 += 1
            }
            states[i][j] = Swift.min(dis1, dis2, dis3)
        }
    }
    
    // 动态规划，莱文斯坦数组
    print("莱文斯坦状态数组=>")
    for i in 0...aChArr.count {
        for j in 0...bChArr.count {
            print("\(states[i][j]) ", terminator: "")
        }
        print("")
    }
    
    // 返回最终结果
    return states[aChArr.count][bChArr.count]
}

// 莱文斯坦最小编辑距离
private var minEdistDist: Int = Int.max

/// 回溯算法计算莱文斯坦距离
///
/// - Parameters:
///   - aString: 第一个字符串
///   - bString: 第二个字符串
/// - Returns: 莱文斯坦距离
func lstDistance(aString: String, bString: String) -> Int {
    lstDistance(iStr: aString, jStr: bString, i: 0, j: 0, edist: 0)
    return minEdistDist
}

/// 回溯算法计算
///
/// - Parameters:
///   - iStr: 第一个字符串
///   - jStr: 第二个字符串
///   - i: 第一个字符串的当前检测下标
///   - j: 第二个字符串的当前检测下标
///   - edist: 当前编辑距离
private func lstDistance(iStr: String, jStr: String, i: Int, j: Int, edist: Int) {
    // 遍历到字符串的最后一个位置的下一个位置，表示遍历完成
    if i == iStr.count || j == jStr.count {
        var finalEdist = edist
        // jStr字符串遍历完成
        if i < iStr.count {
            finalEdist += (iStr.count - i)
        }
        
        // iStr字符串遍历完成
        if j < jStr.count {
            finalEdist += (jStr.count - j)
        }
        
        // 比较较小编辑距离
        if finalEdist < minEdistDist {
            minEdistDist = finalEdist
        }
        return
    }
    
    let iIndex = iStr.index(iStr.startIndex, offsetBy: i)
    let jIndex = jStr.index(jStr.startIndex, offsetBy: j)
    if iStr[iIndex] == jStr[jIndex] {
        // 两个字符串中的字符匹配
        lstDistance(iStr: iStr, jStr: jStr, i: i+1, j: j+1, edist: edist)
    } else {
        /** 如果字符不相等，应该如何处理？
         * 可以删除 a[i]，然后递归考察 a[i+1]和 b[j]
         * 可以删除 b[j]，然后递归考察 a[i]和 b[j+1]
         * 可以在 a[i] 前面添加一个跟 b[j] 相同的字符，然后递归考察 a[i] 和 b[j+1]
         * 可以在 b[j] 前面添加一个跟 a[i] 相同的字符，然后递归考察 a[i+1] 和 b[j]
         * 可以将 a[i] 替换成 b[j]，或者将 b[j] 替换成 a[i]，然后递归考察 a[i+1] 和 b[j+1]
         */
        
        // 删除a[i]或者b[j]前添加一个字符
        lstDistance(iStr: iStr, jStr: jStr, i: i+1, j: j, edist: edist + 1)
        
        // 删除b[j]或者a[i]前添加一个字符
        lstDistance(iStr: iStr, jStr: jStr, i: i, j: j+1, edist: edist + 1)
        
        // 将a[i]和b[j]替换为相同字符
        lstDistance(iStr: iStr, jStr: jStr, i: i+1, j: j+1, edist: edist + 1)
    }
    
}
