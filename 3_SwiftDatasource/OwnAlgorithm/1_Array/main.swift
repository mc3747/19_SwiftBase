//
//  main.swift
//  1_Array
//
//  Created by kk on 2021/8/11.
//

import Foundation

//struct来写数组
//structArrayDemo()

//class来写数组
classArrayDemo()

//指针来写数组
//arrayDemo()

//setDemo()

//mergeDemo()

func structArrayDemo() {
    var arr = ExpandArray<Int>(repeating: 0, count: 10)

    for element in 0...6 {
        arr.add(element)
    }

    arr.add(at: 6, newElement: 100)
    arr.add(at: 0, newElement: 200)
    arr.add(at: 0, newElement: 300)
    arr.add(400)
    print(arr)
    
}
func classArrayDemo() {
    var arr = ArrayList<Int>.init(5);
    print(arr.isEmpty())
    arr.append(4)
    arr.insert(0, 0)
    print(arr)
}

func arrayDemo(){
    print("==================动态扩容数组===================")
    let array = DynamicExpansionArray(capcity: 10)
    for i in 1..<20 {
        array.add(num: i)
    }
    array.print()

    array.insert(num: 30, at: 25)
    array.print()

    array.insert(num: 31, at: 2)
    array.print()

    array.remove(at: 1)
    array.print()
}

func setDemo(){
    print("\n=================动态扩容集合Set====================")
    let set = DynamicExpansionSet(capcity: 10)
    for i in 1..<20 {
        set.add(num: i)
    }
    set.print()

    set.add(num: 99)
    set.print()

    set.remove(num: 15)
    set.print()

    set.add(num: 87)
    set.print()
}
    
    
func mergeDemo(){
    print("\n=================合并两个有序数组====================")
    let array1 = [1, 8, 9, 10, 14]
    let array2 = [4, 9, 13, 20, 25]
    let count = array1.count + array2.count

    let sortedArray = mergeTwoSortedArray(arrOne: array1, arrOneCount: array1.count, arrTwo: array2, arrTwoCount: array2.count)
    printArray(arr: sortedArray, count: count)
    sortedArray.deallocate()
}
