
//1_可选值(相当于有初始值为nil的普通变量)
var i: Int? = 404
    //可选值和nil,nil 不能用于非可选的常量和变量
    i = nil

    //可选值和if语句
if i != nil {
    print("go go go")
}else{
    print("no no no")
}
    //可选绑定:i有值才赋值给number,i没有值,就不初始化给number,核心:右侧的可选项,是否有值;有值的话,直接强制解包,没有值,可选项绑定失败
if let number = i {
    print(number)
}else{
    print("失败")
}
    //可选项绑定,需要使用逗号

//2_强制解包(强制拿出里边的值,原本的值不变)
var age : Int? = 20
var ageInt = age!
ageInt += 10
//print(age)

//可选值的应用:Int运算符
let number = Int("333")

//3_空合并运算符
/*
     1_a??b
     条件:
        a必须是可选项
        b是可选项,或者不是可选项
        b和a的存储类型一致
     使用:
        如果a不是nil,返回a
        如果a不是nil,而且b不是可选项,返回a的自动解包
        如果a是nil,返回b
     结论:
        ⚠️返回的类型取决于b
     
     2_多个??
     
     3_if let和??使用
    
        if let c = a??b{
     print(c)
     }
     等价于a!=nil || b!=nil
 
     if let c = a,d = b{
        print(c)
        print(d)
     }
     等价于a!=nil && b!=nil
 
 */

//4_guard语句
/*
 1_条件和if相反
    条件为false,进入大括号
    条件为true,跳出guard语句
 2_变量可以在外层使用,
 3_特别适合提前退出
 */

//5_隐式可选类型,隐式解包
/*
 不确定有值,用?
 确保可选项一直有值,用!
 确定有值,尽量不用可选项,如num1
 */
var num1:Int = 10
var num2:Int? = 11
var num3:Int! = 12
print(num1)
print(num2!)
print(num3)
num3 = nil
print(num3)

//6_字符串插值

//7_多重可选项
    //a2和a3等效
var a1:Int?=10
var a2:Int?? = a1
var a3:Int?? = 10
    //a2和a3不等效
var a4:Int?=nil
var a5:Int?? = a4
var a6:Int?? = nil
