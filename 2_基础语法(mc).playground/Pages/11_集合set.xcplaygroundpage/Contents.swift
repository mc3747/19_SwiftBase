//: [Previous](@previous)

import Foundation

//1_创建集合的方式
    //方法1:
    var letters = Set<Character>()
    //方法2:使用数组字面量
    var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]


//2_属性和方法
    //count
    //isEmpty
    //contains(_:)是否包含特定值
    
//3_添加
    //insert(_:) 方法来添加一个新元素

//4_删除元素
    //remove(_:) 方法去删除一个元素

//5_集合的遍历
    //Swift 的 Set 类型没有确定的顺序，为了按照特定顺序来遍历一个集合中的值可以使用 sorted() 方法，它将返回一个有序数组，这个数组的元素排列顺序由操作符 < 对元素进行比较的结果来确定
    for genre in favoriteGenres.sorted() {
        print("\(genre)")
    }

//6_集合的操作
    /*
     使用 intersection(_:) 方法根据两个集合的交集创建一个新的集合。
     使用 symmetricDifference(_:) 方法根据两个集合不相交的值创建一个新的集合。
     使用 union(_:) 方法根据两个集合的所有值创建一个新的集合。
     使用 subtracting(_:) 方法根据不在另一个集合中的值创建一个新的集合。
     */
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]

//7_集合关系的判断
    /*
 let houseAnimals: Set = ["🐶", "🐱"]
 let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
 let cityAnimals: Set = ["🐦", "🐭"]

 houseAnimals.isSubset(of: farmAnimals)
 // true
 farmAnimals.isSuperset(of: houseAnimals)
 // true
 farmAnimals.isDisjoint(with: cityAnimals)
 // true
    */
    let houseAnimals: Set = ["🐶", "🐱"]
    let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
    let cityAnimals: Set = ["🐦", "🐭"]

    houseAnimals.isSubset(of: farmAnimals)
    // true
    farmAnimals.isSuperset(of: houseAnimals)
    // true
    farmAnimals.isDisjoint(with: cityAnimals)
    // true
