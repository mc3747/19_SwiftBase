//: Playground - noun: a place where people can play

import UIKit

var A = 10
var B = 20

// 1，算术运算符
    //swift3 中已经取消了++、--
print("A + B 结果为：\(A + B)")
print("A - B 结果为：\(A - B)")
print("A * B 结果为：\(A * B)")
print("B / A 结果为：\(B / A)")
A += 1   // 类似 A++
print("A += 1 后 A 的值为 \(A)")
B -= 1   // 类似 B--
print("B -= 1 后 B 的值为 \(B)")

// 2，比较运算符
print("A == B 结果为：\(A == B)")
print("A != B 结果为：\(A != B)")
print("A > B 结果为：\(A > B)")
print("A < B 结果为：\(A < B)")
print("A >= B 结果为：\(A >= B)")
print("A <= B 结果为：\(A <= B)")

// 3，逻辑运算符
    //大括号作用与OC一样，限定了变量的作用域
if A != 10{
    
    var A = true
    var B = false
    
    print("A && B 结果为：\(A && B)")
    print("A || B 结果为：\(A || B)")
    print("!A 结果为：\(!A)")
    print("!B 结果为：\(!B)")
}

// 4，位运算符
if A != 10{
    
    var A = 60  // 二进制为 0011 1100
    var B = 13 // 二进制为 0000 1101
    
    print("A&B 结果为：\(A&B)")
    print("A|B 结果为：\(A|B)")
    print("A^B 结果为：\(A^B)")
    print("~A 结果为：\(~A)")
}

// 5，赋值运算符
    /*
     =      简单的赋值运算，指定右边操作数赋值给左边的操作数。	C = A + B 将 A + B 的运算结果赋值给 C
     +=     相加后再赋值，将左右两边的操作数相加后再赋值给左边的操作数。	C += A 相当于 C = C + A
     -=     相减后再赋值，将左右两边的操作数相减后再赋值给左边的操作数。	C -= A 相当于 C = C - A
     *=     相乘后再赋值，将左右两边的操作数相乘后再赋值给左边的操作数。	C *= A 相当于 C = C * A
     /=     相除后再赋值，将左右两边的操作数相除后再赋值给左边的操作数。	C /= A 相当于 C = C / A
     %=     求余后再赋值，将左右两边的操作数求余后再赋值给左边的操作数。	C %= A is equivalent to C = C % A
     <<=	按位左移后再赋值        C <<= 2 相当于 C = C << 2
     >>=	按位右移后再赋值        C >>= 2 相当于 C = C >> 2
     &=     按位与运算后赋值        C &= 2 相当于 C = C & 2
     ^=     按位异或运算符后再赋值	 C ^= 2 相当于 C = C ^ 2
     |=     按位或运算后再赋值       C |= 2 相当于 C = C | 2
    */
if A != 10{
    
    var A = 10
    var B = 20
    var C = 100
    
    C = A + B
    print("C 结果为：\(C)")
    
    C += A
    print("C 结果为：\(C)")
    
    C -= A
    print("C 结果为：\(C)")
    
    C *= A
    print("C 结果为：\(C)")
    
    C /= A
    print("C 结果为：\(C)")
    
    C %= A
    print("C 结果为：\(C)")
    
    C <<= A
    print("C 结果为：\(C)")
    
    C >>= A
    print("C 结果为：\(C)")
    
    C &= A
    print("C 结果为：\(C)")
    
    C ^= A
    print("C 结果为：\(C)")
    
    C |= A
    print("C 结果为：\(C)")
    
}


// 6，区间运算符
    /*
        1,闭区间运算符	闭区间运算符（a...b）定义一个包含从a到b(包括a和b)的所有值的区间，b必须大于等于a。 ‌ 闭区间运算符在迭代一个区间的所有值时是非常有用的，如在for-in循环中：	1...5 区间值为 1, 2, 3, 4 和 5
        2,半开区间运算符	半开区间（a..	1..< 5 区间值为 1, 2, 3, 和 4
    */

print("闭区间运算符:")
for index in 1...5 {
    print("\(index) * 5 = \(index * 5)")
}

print("半开区间运算符:")
for index in 1..<5 {
    print("\(index) * 5 = \(index * 5)")
}

// 7，一元、二元和三元运算符
if B != 10 {
    
    var A = 1
    var B = 2
    var C = true
    var D = false
    print("-A 的值为：\(-A)")
    print("A + B 的值为：\(A + B)")
    print("三元运算：\(C ? A : B )")
    print("三元运算：\(D ? A : B )")
}




