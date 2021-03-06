//
//  Greedy.swift
//  Greedy
//
//  Created by ggl on 2020/7/12.
//  Copyright © 2020 ggl. All rights reserved.
//  贪心算法

import Foundation

/// 贪心、分治、回溯、动态规划四个算法思想
/// 贪心算法解决问题的步骤：
/// 1. 第一步，首先要联想到贪心算法：
/// 针对一组数据，我们定义了限制值和期望值，希望从中选出几个数据，在满足限制值的情况下，期望值最大；
/// 2. 第二步，尝试问题是否可以用贪心算法解决：
/// 每次选择当前情况下，在对限制值同等贡献的情况下，对期望值贡献最大的数据
/// 3. 第三步，举例看下贪心算法产生的结果是否最优：
/// 用贪心算法解决问题的思路，并不总能给出最优解


/// 1. 分糖果
/// 我们有 m 个糖果和 n 个孩子。我们现在要把糖果分给这些孩子吃，但是糖果少，孩子多（m<n），所以糖果只能分配给一部分孩子。
/// 每个糖果的大小不等，这 m 个糖果的大小分别是 s1，s2，s3，……，sm。除此之外，每个孩子对糖果大小的需求也是不一样的，只有糖果的大小大于等于孩子的对糖果大小的需求的时候，孩子才得到满足。假设这 n 个孩子对糖果大小的需求分别是 g1，g2，g3，……，gn。
/// 问题是，如何分配糖果，能尽可能满足最多数量的孩子？
///
/// 思路：
/// 可以把这个问题抽象成，从 n 个孩子中，抽取一部分孩子分配糖果，让满足的孩子的个数（期望值）是最大的。这个问题的限制值就是糖果个数 m。
/// 我们每次从剩下的孩子中，找出对糖果大小需求最小的，然后发给他剩下的糖果中能满足他的最小的糖果，这样得到的分配方案，也就是满足的孩子个数最多的方案。
/// 补充：分糖果不能使用贪心算法，如果使用可以加个条件一个孩子只能分一个糖果，因为可能存在孩子的满意度大于最小的糖果，但是最小的两个的和刚好满足。这个情况贪心就无法满足了。


/// 2. 钱币找零
/// 假设我们有 1 元、2 元、5 元、10 元、20 元、50 元、100 元这些面额的纸币，它们的张数分别是 c1、c2、c5、c10、c20、c50、c100。我们现在要用这些钱来支付 K 元，最少要用多少张纸币呢？
///
/// 思路：
/// 在生活中，我们肯定是先用面值最大的来支付，如果不够，就继续用更小一点面值的，以此类推，最后剩下的用 1 元来补齐。
/// 补充：找零问题需要注意，考虑币值为100，99和1的币种，每种各一百张，找396元。（问题就变成了背包问题，需要用动态规划求解）
/// 动态规划可求出四张99元，但贪心算法解出需三张一百和96张一元。
/// 另外需要注意：
/// 货币找零问题如果没有C1货币的话得用动态规划去解，如果出现{C2，C7，C10}货币找零11块的时候使用greedy就会出现找不开的情况；
/// 有C1就不会出现找不开的情况且多个C1可以构成任何面值，所以这种情况下使用greedy是对的；


/// 3. 区间覆盖
/// 假设我们有 n 个区间，区间的起始端点和结束端点分别是[l1, r1]，[l2, r2]，[l3, r3]，……，[ln, rn]。我们从这 n 个区间中选出一部分区间，这部分区间满足两两不相交（端点相交的情况不算相交），最多能选出多少个区间呢？
///
/// 思路：
/// 我们假设这 n 个区间中最左端点是 lmin，最右端点是 rmax。这个问题就相当于，我们选择几个不相交的区间，从左到右将[lmin, rmax]覆盖上。我们按照起始端点从小到大的顺序对这 n 个区间排序。
/// 我们每次选择的时候，左端点跟前面的已经覆盖的区间不重合的，右端点又尽量小的，这样可以让剩下的未覆盖区间尽可能的大，就可以放置更多的区间。这实际上就是一种贪心的选择方法。


/// 霍夫曼编码问题
/// 霍夫曼编码不仅会考察文本中有多少个不同字符，还会考察每个字符出现的频率，根据频率的不同，选择不同长度的编码
/// 根据贪心的思想：把出现频率比较多的字符，用稍微短一些的编码；出现频率比较少的字符，用稍微长一些的编码


/// 问题：在一个非负整数 a 中，我们希望从中移除 k 个数字，让剩下的数字值最小，如何选择移除哪 k 个数字呢？
/// 思路：
/// 非负整数，移除固定个数的数字，不管怎么移动最后剩下的位数都是固定的，只要我们保证最高位尽可能的小，就能让最后的数值最小。
/// 每次比较最高位和次高位，移除最大的那个数。这样最后的最高位总是最小的，值也就是最小的


/// 在非负整数中，移除K个数字，让剩下的数字值最小，返回最小的数字
/// - Parameters:
///   - num: 原数
///   - removeCount: 移除的位数
/// - Returns: 最小数字值
func findMinimum(num: UInt, removeCount: UInt) -> UInt {
    var removeCount = removeCount
    if num == 0 || removeCount == 0 {
        return num
    }
    
    // 存储数字所有的数字
    var arr = [UInt]()
    var n = num
    while n != 0 {
        arr.append(n % 10)
        n = n / 10
    }
    
    if arr.count < removeCount {
        print("移除的位数过多！")
        return num
    }
    
    // 从高位开始，比较第一位数字，如果高位大，则移除；若高位小，则向右移动一位继续比较两个数字
    outer: while removeCount != 0 {
        var max = arr.last!
        for i in (0..<arr.count-1).reversed() {
            let curNum = arr[i]
            
            // 高位比低位大，则移除
            if max > curNum {
                arr.remove(at: i+1)
                removeCount -= 1
                continue outer
            } else {
                max = curNum
            }
        }
        
        // 删除最低位数字，最低位是最大的数字
        arr.removeFirst()
        removeCount -= 1
    }
    
    var result: UInt = 0
    for (i, num) in arr.enumerated() {
        result = result + UInt(pow(10.0, Double(i))) * num
    }
    return result
}

/// 假设有 n 个人等待被服务，但是服务窗口只有一个，每个人需要被服务的时间长度是不同的，如何安排被服务的先后顺序，才能让这 n 个人总的等待时间最短？
/// 思路：
/// 不管先服务谁，后面等待的人数都是固定的，每服务完一个人剩下等待的人就少一个，那么我们只需保证最少服务时间去匹配最大等待人数，就可以保证最终总服务时间最小
/// 假设5个人，时间分别是1-5-3-4-2分钟，等待的时间是每个人等待时间的总和即单个服务时间*剩余等待人数。
/// 不管现在服务的是谁，剩余等待的人数是不会变的，所以只需要找单个服务时间最小的，即按服务时间数升序服务即1-2-3-4-5，总的时间为1*4+2*3+3*2+4*1=20
