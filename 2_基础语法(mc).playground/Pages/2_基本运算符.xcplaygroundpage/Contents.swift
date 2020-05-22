//1_空和运算符??

//2_区间运算符
    //1_闭区间运算符
    for  index in 1...5 {
        print("闭区间_\(index) ")
    }
    //2_半开区间运算符
    for index in 1..<5 {
          print("半开区间_\(index)")
      }
    //3_单侧区间运算符
    var names:[Int] = [1,2,3]
    for name in names[...2] {
        print("单侧区间_\(name)")
    }
