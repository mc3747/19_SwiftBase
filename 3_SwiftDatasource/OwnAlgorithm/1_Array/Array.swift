//
//  Array.swift
//  Array
//
//  Created by JIANG SHOUDONG on 2020/3/2.
//  Copyright © 2020 姜守栋. All rights reserved.
//

import Foundation

@discardableResult
prefix func ++(value: inout Int) -> Int {
    value += 1
    return value
}

@discardableResult
postfix func ++(value: inout Int) -> Int {
    let oldValue = value
    value += 1
    return oldValue
}

@discardableResult
prefix func --(value: inout Int) -> Int {
    value -= 1
    return value
}

@discardableResult
postfix func --(value: inout Int) -> Int {
    let oldValue = value
    value -= 1
    return oldValue
}


public struct ExpandArray<T: Equatable>: CustomDebugStringConvertible {

    private var size: Int
    private var elements: [T]
    private var defaultValue: T
    private var capacity = 10
    private let ELEMENT_NOT_FOUND = -1
    // 当前开始位置指向的索引值, 优化增删时元素的移动次数
    private var start = 0
    public var debugDescription: String {
        var desc = "start = \(start), size = \(size), elements = ["
        for index in 0..<size {
            let realIdx = realIndex(index)
            if index == size - 1 {
                desc += "\(elements[realIdx])"
            } else {
                desc += "\(elements[realIdx]), "
            }
            
        }
        desc += "]"
        print("elements.description" + elements.description)
        return desc
    }
}

// MARK: - public
extension ExpandArray {
    
    /// 初始化一个数组
    /// - Parameter repeatedValue: 数组元素的默认值
    init(repeating repeatedValue: T) {
        defaultValue = repeatedValue
        elements = [T](repeating: repeatedValue, count: capacity)
        size = 0
    }
    /// 初始化一个数组
    /// - Parameters:
    ///   - repeatedValue: 数组元素的默认值
    ///   - count: 数组的初始化容量
    init(repeating repeatedValue: T, count: Int) {
        capacity = count
        defaultValue = repeatedValue
        elements = [T](repeating: repeatedValue, count: capacity)
        size = 0
    }
    /// 清除所有元素
    mutating func clear() {
        size = 0
        start = 0
    }
    /// 数组长度
    var count: Int {
        get {
            size
        }
    }
    /// 是否为空
    var isEmpty: Bool {
        get {
            size == 0
        }
    }
    /// 是否包含元素
    /// - Parameter element: 元素值
    func contains(_ element: T) -> Bool {
        return indexOf(element) != ELEMENT_NOT_FOUND
    }
    
    @discardableResult
    mutating func set(at index: Int, newElement: T) -> T {
        let oldElement = elements[index]
        elements[index] = newElement
        return oldElement
    }
    
    func getElement(at index: Int) -> T {
//        try! checkIndex(index)
        return elements[index]
    }
    
    subscript(index: Int) -> T {
        set {
            elements[index] = newValue
        }
        get {
            elements[index]
        }
    }
    
    /// 添加元素
    /// - Parameter newElement
    mutating func add(_ newElement: T) {
        add(at: size, newElement: newElement)
    }
    
    /// 指定位置添加元素
    /// - Parameters:
    ///   - index: 位置
    ///   - newElement: 元素
    mutating func add(at index: Int, newElement: T) {
//        try? checkIndex(index)
        ensureCapacity(capacity: size + 1)
        if index == size {
            elements[realIndex(size++)] = newElement
        } else if index == 0 {
            start =  start > 0 ? (start - 1) : (elements.count - 1)
            elements[start] = newElement
            size++
        } else {
            let middleIdx = size >> 1
            if index > middleIdx {
                for idx in (index..<size).reversed() {
                    elements[idx+1] = elements[idx]
                }
            } else {
                start = start - 1 < 0 ? (capacity - 1) : (start - 1)
                for idx in (0..<index) {
                    let realIdx = realIndex(idx)
                    elements[realIdx] = elements[idx]
                }
            }
            elements[realIndex(index)] = newElement
            size++
        }
    }
    
    @discardableResult
    mutating func remove(_ element: T) -> T {
        remove(at: indexOf(element))
    }
    
    @discardableResult
    mutating func remove(at index: Int) -> T {
        let oldElement = elements[index]
        
        if index == 0 {
            start++
        }
        if (1..<(size - 1)).contains(index) {
            let middleIdx = size >> 1
            
            if index > middleIdx {
                for idx in index+1..<size {
                    elements[idx-1] = elements[idx]
                }
            } else {
                for idx in (0..<index).reversed() {
                    elements[idx+1] = elements[idx]
                }
                start++
            }
        }
        size--
        return oldElement
    }
}

// MARK: - Private Helpers
extension ExpandArray {
    enum ArrayError: Error {
        case msg(String)
    }
    
    private func checkIndex(_ index: Int) throws {
        if !(0...size).contains(index)  {
            throw ArrayError.msg("数组越界, Index = \(index)")
        }
    }
    
    /// 动态扩容
    /// - Parameter capacity:
    private mutating func ensureCapacity(capacity: Int) {
        let oldCapacity = elements.count
        if capacity > oldCapacity {
            let oldElements = elements
            let newCapacity = oldCapacity + (oldCapacity >> 1)
            elements = [T](repeating: defaultValue, count: newCapacity)
            for (idx, _) in oldElements.enumerated() {
                elements[idx] = oldElements[realIndex(idx)]
            }
            start = 0
            self.capacity = newCapacity
        }
        
    }
    
    /// 查找元素在数组中的索引
    /// - Parameter element: 元素
    private func indexOf(_ element: T) -> Int {
        for idx in 0..<size {
            let realIdx = realIndex(idx)
            if element == elements[realIdx] {
                return realIdx
            }
        }
        return ELEMENT_NOT_FOUND
    }
    
    /// 获取真正的索引
    /// - Parameter index
    private func realIndex(_ index: Int) -> Int {
        return (start + index >= capacity) ? (start + index) % capacity : (start + index)
    }
}
