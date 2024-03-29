//
//  MergeSortFunc.swift
//  Sort
//
//  Created by ggl on 2019/4/17.
//  Copyright © 2019 ggl. All rights reserved.
//  归并排序

import Foundation

/// 归并排序
/// 归并排序有两种：自顶向下和自底向上
/// 归并排序时间复杂度为O(N*logN),相当于完全二叉树，需要遍历的次数就是完全二叉树的深度
/// 归并排序是稳定的排序算法
///
/// - Parameter array: 要排序的数组
/// - Returns: 排序好之后的数组
func mergeSort(_ array: [Int]) -> [Int] {
    var sortArray = array
    mergeSortDecompose(&sortArray, low: 0, high: sortArray.count-1)
    return sortArray
}

/// 自顶向下的排序方式，对分解（分治思想）
///
/// - Parameters:
///   - array: 要排序的数组
///   - low: 数组最小下标
///   - high: 数组最大下标
func mergeSortDecompose(_ array: inout [Int], low: Int, high: Int) {
    if low >= high {
        return
    }
    
    // 递归拆分为小模块
    let mid = (low + high) / 2
    mergeSortDecompose(&array, low: low, high: mid)
    mergeSortDecompose(&array, low: mid+1, high: high)
    
    // 将拆解完的数据合并到一起
    mergeArray(&array, low: low, mid: mid, high: high)
}

/// 自底向上的归并排序
/// 分别以len = 1, len = 2, len = 4, len = 8，... 来调整数组
/// - Parameter array: 待排序的数组
/// - Returns: 已经排好序的数组
func mergeSortFromBottom(_ array: [Int]) -> [Int] {
    var array = array
    var len = 1
    while len < array.count {
        // 注意，条件必须是小于 array.count - len，否则会越界
        for low in stride(from: 0, to: array.count-len, by: 2*len) {
            mergeArray(&array, low: low, mid: low+len-1, high: Swift.min(low+2*len-1, array.count-1))
        }
        
        // 长度*2
        len *= 2
    }
    return array
}

/// 合并两个小模块的数据
///
/// - Parameters:
///   - array: 原始要排序的数组
///   - low: 小模块的最小下标
///   - mid: 小模块的最大下标
///   - high: 另一个小模块的最大下标
func mergeArray(_ array: inout [Int], low: Int, mid: Int, high: Int) {
    var i = low, j = mid + 1, k = 0
    
    // 临时数组，用来顺序存储两个模块中的数据，大小应为high-low+1
    var tempArray = [Int](repeating: 0, count: high-low+1)
    while i <= mid && j <= high {
        if array[i] <= array[j] {
            tempArray[k] = array[i]
            i += 1
            k += 1
        } else {
            tempArray[k] = array[j]
            j += 1
            k += 1
        }
    }
    
    // 将剩余的元素放入数组中
    while i <= mid {
        tempArray[k] = array[i]
        i += 1
        k += 1
    }
    while j <= high {
        tempArray[k] = array[j]
        j += 1
        k += 1
    }
    
    // 将临时数组中排序好的数据，复制回原数组
    array[low...high] = ArraySlice(tempArray)
}
