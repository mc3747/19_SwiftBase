
class ArrayList<T: Equatable> {
    // 元素数量(只读)
    private(set) var count: Int = 0
    // 使用nil作为占位
    private var elements: [T?]
    // 首位元素索引
    private var frontIndex = 0
    // 默认10个元素
    private let DEFAULT_CAPACITY = 10
    private let ELEMENT_NOT_FOUND = -1
    
    // 构造器, 初始化容量为capaticy的数组
    init(_ capaticy: Int) {
        let capaticy = capaticy < DEFAULT_CAPACITY ? DEFAULT_CAPACITY : capaticy
        elements = [T?](repeating: nil, count: capaticy)
    }
    
    // 是否为空
    func isEmpty() -> Bool {
        return count == 0
    }
    
    // 插入元素
    func insert(_ item: T, _ index: Int) {
        if index < 0 || index > count {
            // 越界
            fatalError("索引有误, 已经越界")
        }
        ensureCapacity()
        for idx in (index..<count).reversed() {
            elements[actualIndex(idx + 1)] = elements[actualIndex(idx)]
        }
        count += 1
        elements[actualIndex(index)] = item
    }
    
    // 追加元素
    func append(_ item: T) {
        insert(item, count)
    }
    
    // 获取索引所在元素
    func get(_ index: Int) -> T {
        checkBounds(index)
        return elements[actualIndex(index)]!
    }
    
    // 设置元素
    func set(_ item: T, _ index: Int) {
        checkBounds(index)
        elements[actualIndex(index)] = item
    }
    
    // 移除元素
    func remove(_ index: Int) -> T {
        let ele = elements[actualIndex(index)]!
        if index == 0 {
            elements[frontIndex] = nil
            frontIndex += 1
        } else {
            for idx in index..<count {
                elements[actualIndex(idx)] = elements[actualIndex(idx + 1)]
            }
            elements[actualIndex(count - 1)] = nil
        }
        count -= 1
        return ele
    }
    
    // 清空元素
    func clear() {
        for idx in 0..<count {
            elements[actualIndex(idx)] = nil
        }
        count = 0
    }
    
    // 是否包含某个元素
    func contains(_ item: T) -> Bool {
        // item 不可能为nil
        return indexOf(item) != ELEMENT_NOT_FOUND
    }
    
    // 获取某个元素对应的索引
    private func indexOf(_ item: T) -> Int {
        // 这里的item不可能为nil
        for idx in 0..<count {
            if elements[actualIndex(idx)]! == item {
                return idx
            }
        }
        return ELEMENT_NOT_FOUND
    }
    
    // 获取真实索引: (frontIndex + index) % elements.count
    private func actualIndex(_ idx: Int) -> Int {
        return (frontIndex + idx) % elements.count
    }
    
    // 数组扩容
    private func ensureCapacity() {
        if count == elements.count {
            var elements = self.elements
            // 扩容1.5倍
            let newCapacity = elements.count + elements.count >> 1
            self.elements = [T?](repeating: nil, count: newCapacity)
            for idx in 0..<count {
                let index = (frontIndex + idx) % elements.count
                self.elements[idx] = elements[index]
            }
            frontIndex = 0
        }
    }
    
    // 索引越界检查
    private func checkBounds(_ index: Int) {
        if index < 0 || index >= count {
            // 越界
            fatalError("索引有误, 已经越界")
        }
    }
    
    // 数组内容打印
    public func desc() {
        var str = "["
        for idx in 0..<elements.count {
            var a = ", "
            if idx == 0 {
                a = ""
            }
            if elements[idx] != nil {
                str += "\(a)\(elements[idx]!)"
            } else {
                str += "\(a)nil"
            }
        }
        str += "], frontIndex = \(frontIndex), count = \(count)"
        print(str)
    }
}
