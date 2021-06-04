//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: 泛型的概念Generics

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

