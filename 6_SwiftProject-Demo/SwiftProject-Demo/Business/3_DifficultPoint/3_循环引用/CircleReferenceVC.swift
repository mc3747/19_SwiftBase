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
        demo7()
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
    func demo4(){
        class HTMLElement {
            
            let name: String
            let text: String?
            
            lazy var asHTML: () -> String = {
                //可以使用weak和unowned来修饰，防止循环引用
                //                [unowned self] in
                if let text = self.text {
                    return "<\(self.name)>\(text)</\(self.name)>"
                } else {
                    return "<\(self.name) />"
                }
            }
            
            init(name: String, text: String? = nil) {
                self.name = name
                self.text = text
            }
            
            deinit {
                print("\(name) is being deinitialized")
            }
            
        }
        let paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
        print(paragraph!.asHTML())
        
        
    }
    
    //MARK: ✅定时器循环引用
    //    以下两种方法都会造成循环引用
    //    var time: Timer?
    weak var time: Timer?
    func demo5(){
        
        time = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timePrint), userInfo: nil, repeats: true)
    }
    
    
    //   解决办法1：使用系统提供Block方法
    func demo6(){
        if #available(iOS 10.0, *) {
            /// iOS 10之后采用`Block`方式解决Timer 循环引用问题
            time = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { [weak self] (timer) in
                guard let `self` = self else { return }
                self.timePrint()
            })
        }
    }
    
    //   解决办法2：使用GCD提供的DispatchSource替换Timer
    var source: DispatchSourceTimer?
    func demo7(){
        source = DispatchSource.makeTimerSource(flags: [], queue: .global())
        source?.schedule(deadline: .now(), repeating: 2)
        source?.setEventHandler {
            
            self.timePrint()
        }
        source?.resume()
    }
    //    解决办法3：模仿系统提供的closure
    
    func demo8(){
        if #available(iOS 10.0, *) {
            /// iOS 10之后采用`Block`方式解决Timer 循环引用问题
            time = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { [weak self] (timer) in
                guard let `self` = self else { return }
                self.timePrint()
            })
        } else {
            /// iOS 10之前的解决方案： 模仿系统的`closure` 解决Timer循环引用问题
            time = Timer.rp_scheduledTimer(timeInterval: 2, repeats: true, closure: { [weak self] (timer) in
                guard let `self` = self else { return }
                self.timePrint()
            })
        }
    }
    
    //    解决办法4：使用Runtime给对象添加消息处理的方法
    
    //    解决办法5：使用NSProxy类作为中间对象
    
    @objc func timePrint() {
        print("打印")
    }
    deinit {
        print("deinit---------------------11111")
        time?.invalidate()
        time = nil
        
        source?.cancel()
        source = nil
    }
}

extension Timer {
    class func rp_scheduledTimer(timeInterval ti: TimeInterval, repeats yesOrNo: Bool, closure: @escaping (Timer) -> Void) -> Timer {
        return self.scheduledTimer(timeInterval: ti, target: self, selector: #selector(RP_TimerHandle(timer:)), userInfo: closure, repeats: yesOrNo)
    }
    
    @objc class func RP_TimerHandle(timer: Timer) {
        var handleClosure = { }
        handleClosure = timer.userInfo as! () -> ()
        handleClosure()
    }
}

