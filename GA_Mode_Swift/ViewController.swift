//
//  ViewController.swift
//  GA_Mode_Swift
//
//  Created by houjianan on 16/7/7.
//  Copyright © 2016年 houjianan. All rights reserved.
//

//迭代器模式（Iterator），提供一种方法顺序访问一个聚合对象中的各种元素，而又不暴露该对象的内部表示。
/**
 *  访问一个聚合对象的内容而无需暴露它的内部表示
 *  支持对聚合对象的多种遍历
 *  为遍历不同的聚合结构提供一个统一的接口
 */

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        test()
    }
}

extension ViewController {
    
    func test() {
        let arr: [AnyObject] = ["2", 1, "3", "2", 12.3, Model(name: "name")]
        let item = IteratorItem(item: arr)
        let iterator = Iterator(item: item)
        while !iterator.IsDone() {
            print(iterator.Next())
        }
    }
    
}

protocol IteratorDelegate{
    func First() -> AnyObject;
    func Next() -> AnyObject;
    func CurrentItem() -> AnyObject;
    func IsDone() -> Bool;
}

class Iterator: IteratorDelegate {
    
    var item: IteratorItem!
    var current: Int = 0
    init(item: IteratorItem) {
        self.item = item
    }
    
    func First() -> AnyObject {
        return self.item.list.first!
    }
    
    func Next() -> AnyObject {
        var ret: AnyObject!
        if current < item.list.count {
            ret = item.list[current]
            current += 1
        }
        return ret
    }
    
    func CurrentItem() -> AnyObject {
        return self.item.list[current]
    }
    
    func IsDone() -> Bool {
        return current >= self.item.list.count ? true : false
    }
}

class IteratorItem {
    
    private var list: [AnyObject]!

    init(item: [AnyObject]) {
        self.list = item
    }
    
    var count: Int {
        if let list = self.list {
            return list.count
        }
        return 0
    }
    
    func this(index: Int) -> AnyObject? {
        if let list = self.list {
            return list.count > 0 ? list[index] : nil
        }
        return nil
    }
}

class Model {
    
    var name: String!
    
    init(name: String) {
        self.name = name
    }
}




