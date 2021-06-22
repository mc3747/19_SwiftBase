//
//  CircleReferenceVC.swift
//  SwiftProject-Demo
//
//  Created by kk on 2021/6/18.
//  Copyright © 2021 马成. All rights reserved.
//

import Foundation
@objc (CircleReferenceVC)
class CircleReferenceVC: CommonViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //        demo1()
        demo2()
    }
    
    //✅：循环引用
    func demo1(){
        class Person {
            let name: String
            init(name: String) { self.name = name }
            var apartment: Apartment?
            deinit { print("\(name) is being deinitialized") }
        }
        
        class Apartment {
            let unit: String
            init(unit: String) { self.unit = unit }
            var tenant: Person?
            deinit { print("Apartment \(unit) is being deinitialized") }
        }
        var john: Person?
        var unit4A: Apartment?
        john = Person(name: "John Appleseed")
        unit4A = Apartment(unit: "4A")
        john!.apartment = unit4A
        unit4A!.tenant = john
    }
    //解决循环引用1：弱引用weak
    //weak修饰的属性是可选类型，所引用对象被回收后其属性会被自动置为nil
    func demo2(){
        class Person {
            let name: String
            init(name: String) { self.name = name }
            var apartment: Apartment?
            deinit { print("\(name) is being deinitialized") }
        }
        
        class Apartment {
            let unit: String
            init(unit: String) { self.unit = unit }
            weak var tenant: Person?
            deinit { print("Apartment \(unit) is being deinitialized") }
        }
        var john: Person?
        var unit4A: Apartment?
        john = Person(name: "John Appleseed")
        unit4A = Apartment(unit: "4A")
        john!.apartment = unit4A
        unit4A!.tenant = john
    }
    
    //解决循环引用2：无主引用unowned
    //unowned修饰的属性不是可选类型，所引用对象被回收后属性不会被置为nil，但是不能被访问，否则会出错
    func demo3(){
        class Customer {
            let name: String
            var card: CreditCard?
            init(name: String) {
                self.name = name
            }
            deinit { print("\(name) is being deinitialized") }
        }
        
        class CreditCard {
            let number: UInt64
            unowned let customer: Customer
            init(number: UInt64, customer: Customer) {
                self.number = number
                self.customer = customer
            }
            deinit { print("Card #\(number) is being deinitialized") }
        }
        var john: Customer?
        john = Customer(name: "John Appleseed")
        john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
    }
    
//MARK: ✅闭包循环引用

//MARK: ✅定时器循环引用
    
}
