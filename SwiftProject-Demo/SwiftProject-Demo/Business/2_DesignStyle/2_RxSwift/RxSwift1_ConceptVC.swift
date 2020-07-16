//
//  1_RxSwiftConceptVC.swift
//  SwiftProject-Demo
//
//  Created by 马成 on 2020/7/16.
//  Copyright © 2020 马成. All rights reserved.
//

import UIKit
import RxSwift
/*
Observable发布
Observable订阅
Observable监听
Observable销毁
 特征序列
 调度器
 错误处理
 双向绑定
*/
@objc (RxSwift1_ConceptVC)
class RxSwift1_ConceptVC: UIViewController {
    //全局
    var observable1:Observable<Int>?
    var observable2:Observable<Any>?
    var observable3:Observable<Any>?
    var observable4:Observable<Int>?
    var observable5:Observable<Int>?
    var observable6:Observable<Int>?
    var observable7:Observable<Int>?
    var observable8:Observable<Any>?
    var observable9:Observable<Int>?
    var observable10:Observable<String>?
    var observable11:Observable<Int>?
    var observable12:Observable<Int>?
    var observable13:Observable<Int>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        makeObservable()
        subscribeObservable()
        monitorObservable()
        destroyObservable()
    }
    
//1_创建
    func makeObservable(){
        //1_just() 方法:传入一个默认值来初始化
        self.observable1 = Observable<Int>.just(5)
        
        //2_of() 方法:接受可变数量的参数（必需要是同类型的）
        self.observable2 = Observable.of("A", "B", "C")
        
        //3_from() 方法:该方法需要一个数组参数
        self.observable3 = Observable.from(["A", "B", "C"])
        
        //4_empty() 方法:创建一个空内容的 Observable 序列
        self.observable4 = Observable<Int>.empty()
        
        //5_never() 方法:创建一个永远不会发出 Event（也不会终止）的 Observable 序列
        self.observable5 = Observable<Int>.never()
        
        //6_error() 方法:创建一个不做任何操作，而是直接发送一个错误的 Observable 序列
        enum MyError: Error {
            case A
            case B
        }
        self.observable6 = Observable<Int>.error(MyError.A)
        
        //7_range() 方法:通过指定起始和结束数值，创建一个以这个范围内所有值作为初始值的 Observable 序列
        self.observable7 = Observable.range(start: 1, count: 5)
        
        //8_repeatElement() 方法:创建一个可以无限发出给定元素的 Event 的 Observable 序列（永不终止）
        self.observable8 = Observable.repeatElement(1)
        
        //9_generate() 方法:创建一个只有当提供的所有的判断条件都为 true 的时候，才会给出动作的 Observable 序列
        self.observable9 = Observable.generate(
            initialState: 0,
            condition: { $0 <= 10 },
            iterate: { $0 + 2 }
        )
        
        //10_create() 方法:接受一个 block 形式的参数，任务是对每一个过来的订阅进行处理
        self.observable10 = Observable<String>.create{observer in
                //对订阅者发出了.next事件，且携带了一个数据"hangge.com"
            observer.onNext("hangge.com")
                //对订阅者发出了.completed事件
            observer.onCompleted()
                //因为一个订阅行为会有一个Disposable类型的返回值，所以在结尾一定要returen一个Disposable
            return Disposables.create()
        }
        
        //11_deferred() 方法
            //用于标记是奇数、还是偶数
        var isOdd = true
        self.observable11 = Observable.deferred {
             
            //让每次执行这个block时候都会让奇、偶数进行交替
            isOdd = !isOdd
             
            //根据isOdd参数，决定创建并返回的是奇数Observable、还是偶数Observable
            if isOdd {
                return Observable.of(1, 3, 5 ,7)
            }else {
                return Observable.of(2, 4, 6, 8)
            }
        }
        //12_interval() 方法:每隔一段设定的时间，会发出一个索引数的元素。而且它会一直发送下去,
            //此方法已经失效
            
            
        //13_timer() 方法
            //在经过设定的一段时间后，产生唯一的一个元素
        self.observable12 = Observable<Int>.timer(5, scheduler: MainScheduler.instance)
            //在经过设定的一段时间后，每隔一段时间产生一个元素
        self.observable13 = Observable<Int>.timer(5, period: 1, scheduler: MainScheduler.instance)
    }
    
//2_订阅 Observable
    func subscribeObservable(){
        //1_打印整个事件
        self.observable1?.subscribe { event in
            print(event)
        }
        //2_获取到这个事件里的数据
        self.observable2?.subscribe { event in
            print(event.element as Any)
        }
        //3_通过不同的 block 回调处理不同类型的 event
            // onNext、onError、onCompleted 和 onDisposed 这四个回调 block 参数都是有默认值的，即它们都是可选的
        self.observable3?.subscribe(onNext: { element in
            print(element)
        }, onError: { error in
            print(error)
        }, onCompleted: {
            print("completed")
        }, onDisposed: {
            print("disposed")
        })
    }
//3_监听
    //使用 doOn 方法来监听事件的生命周期，它会在每一次事件发送前被调用
    //do(onNext:) 方法就是在 subscribe(onNext:) 前调用
    //而 do(onCompleted:) 方法则会在 subscribe(onCompleted:) 前面调用
    func monitorObservable(){
        self.observable4?.do(onNext: { element in
            print("Intercepted Next：", element)
        }, onError: { error in
            print("Intercepted Error：", error)
        }, onCompleted: {
            print("Intercepted Completed")
        }, onDispose: {
            print("Intercepted Disposed")
        })
    }
    
//4_销毁
    func destroyObservable(){
    //1_使用dispose来销毁
        //先订阅,并存储
        let subscription = self.observable5?.subscribe { event in
            print(event)
        }
        //再销毁
        subscription?.dispose()
        
    //2_使用dispose来销毁
        //我们可以把一个 DisposeBag 对象看成一个垃圾袋，把用过的订阅行为都放进去。
        //而这个 DisposeBag 就会在自己快要 dealloc 的时候，对它里面的所有订阅行为都调用 dispose() 方法
        let disposeBag = DisposeBag()
                 
            //第1个Observable，及其订阅
        let observable1 = Observable.of("A", "B", "C")
        observable1.subscribe { event in
            print(event)
        }.disposed(by: disposeBag)
            //第2个Observable，及其订阅
        let observable2 = Observable.of(1, 2, 3)
        observable2.subscribe { event in
            print(event)
        }.disposed(by: disposeBag)
    }
}
