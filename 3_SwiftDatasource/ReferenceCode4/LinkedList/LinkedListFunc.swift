//
//  LinkedListFunc.swift
//  LinkedList
//
//  Created by ggl on 2019/3/28.
//  Copyright © 2019年 ggl. All rights reserved.
//  链表功能函数

import Foundation

/// 合并两个有序单链表
///
/// - Parameters:
///   - linkedListOne: 第一个有序单链表
///   - linkedListTwo: 第二个有序单链表
/// - Returns: 合并有序的单链表
func mergeLinkedList(linkedListOne: Node?, linkedListTwo: Node?) -> Node? {
    // 判断链表是否为空
    var p = linkedListOne, q = linkedListTwo
    if p == nil {
        return linkedListTwo
    }
    
    if q == nil {
        return linkedListOne
    }
    
    // 开始合并链表
    let newHead = Node(data: 0, next: nil)
    var temp: Node? = newHead
    while p != nil && q != nil {
        if p!.data <= q!.data {
            temp?.next = p
            p = p?.next
        } else {
            temp?.next = q
            q = q?.next
        }
        temp = temp?.next
    }
    temp?.next = (p == nil ? q : p)
    return newHead.next
}

/// 判断链表是否有环
///
/// - Parameter head: 头结点
/// - Returns: 链表是否有环
func checkLinkedListRingNode(_ head: Node?) -> Bool {
    var slow = head
    var fast = head?.next
    if head?.next == nil {
        return false
    }
    
    // 快慢指针，相交则说明有环
    while fast != nil {
        slow = slow?.next
        fast = fast?.next?.next
        
        if fast?.data == slow?.data {
            return true
        }
    }
    return false
}

/// 找到链表环的位置
///
/// - Parameter head: 链表头结点（必须是有环的链表）
/// - Returns: 环的位置，如果没有找到则是NSNotFound
func findLinkedListRingNodePos(_ head: Node?) -> Int {
    /*
    链表开头与环的入口的距离为a，快慢指针相遇的地点距离环的入口为b，环的长度（节点的数量）为c。
    那么我们可以知道，当快慢指针相遇的时候，快指针走的路程是慢指针的2倍。如果相遇的时候慢指针在环中走了m圈，快指针在环中已经走了n圈，那么必有n/m >= 2。
    
    所以我们可以知道，相遇时，慢指针走的距离s1是a+mc+b，快指针走的距离s2是a+nc+b。
    根据2*s1 = s2，我们有2(a+mc+b) = a+nc+b。
    即a = (n-2m)c-b
    n-2m是一个非负的常数。
    （1）如果n-2m=0，又因为a和b也非负，所以a和b皆为0。意味着相遇点和入口重合，是链表的第一个结点。即环的入口就是链表的第一个结点。
    （2）如果n-2m>0，设为N。则a=Nc-b=(N-1)c + c-b，这个式子意味着从链表开头到环的入口的距离，等于从相遇点到入口的距离。而这个结论在（1）中的特殊情况也适用。*/
    if head == nil {
        return NSNotFound
    }
    var slow = head
    var fast = head?.next
    while fast != nil {
        // 首先找到相遇点
        if slow?.data != fast?.data {
            slow = slow?.next
            fast = fast?.next?.next
            continue
        }
        
        // 再从头开始遍历，直到两个指针相遇
        fast = head
        slow = slow?.next       // 这个地方一定要注意
        while fast?.data != slow?.data {
            slow = slow?.next
            fast = fast?.next
        }
        return slow!.data
    }
    return NSNotFound
}
