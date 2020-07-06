
//1_算数运算符:+ , - ,*,/,
//2_求余运算符 %
//3_赋值运算符 if(a = b)会报错,防止和a == b弄错
//4_比较运算符
    /*
       等于（a == b）
       不等于（a != b）
       大于（a > b）
       小于（a < b）
       大于等于（a >= b）
       小于等于（a <= b）
       恒等（===）和不恒等（!==）这两个比较符来判断两个对象是否引用同一个对象实例
     **/
//5_逻辑运算符
    /*
     逻辑非（!a）
     逻辑与（a && b）
     逻辑或（a || b）
     */

//6_空和运算符??
    //相当于:a != nil ? a! : b
    

//7_区间运算符
    //1_闭区间运算符(1<= a <= 5)
    for  index in 1...5 {
        print("闭区间_\(index) ")
    }
    //2_半开区间运算符(1<= a < 5)
    for index in 1..<5 {
          print("半开区间_\(index)")
      }
    //3_单侧区间运算符(0 <= a <= 2 或者2 <= a <= names.count)
    var names:[Int] = [1,2,3,4]
    for name in names[...2] {
        print("单侧区间_\(name)")
    }
    for name in names[2...] {
        print("单侧区间_\(name)")
    }

//8_运算符
/*
 ++字符串不能用
 但可以用a += 1
 */
var d = 1
d+=1
