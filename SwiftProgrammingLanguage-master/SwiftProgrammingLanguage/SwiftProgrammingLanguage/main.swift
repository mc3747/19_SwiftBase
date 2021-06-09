//
//  main.swift
//  SwiftProgrammingLanguage
//
//  Created by gl on 16/7/5.
//  Copyright © 2016年 gl. All rights reserved.
//  

import Foundation

struct Stack<T> {
    var items = [T]()
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}
var stackOfStrings = Stack<String>()
stackOfStrings.push("undo")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
print(stackOfStrings)
