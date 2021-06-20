//7_元组-tuple
    //直接赋值
let http404Error = (404, "Not Found")
    //元组通过下标访问
var e=(3,"6")
e.0
e.1
    //元组通过元素名称访问
let f = (age:10,name:"dog")
f.age
f.0
    //元组当做类型1
var g:(age:Int,name:String)
g = (15,"baby")
    //元组当做类型2
typealias NewType1 = (Int ,String)
let h:NewType1
h = (6,"猪头")
