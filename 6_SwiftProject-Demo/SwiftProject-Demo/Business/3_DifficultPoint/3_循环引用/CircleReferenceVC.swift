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
    
//循环引用
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
}
