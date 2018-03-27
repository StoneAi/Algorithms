//
//  Algorithms.swift
//  Algorithms
//
//  Created by 石函东 on 2018/2/28.
//  Copyright © 2018年 石函东. All rights reserved.
//

import Foundation
//算法方法
class Algorithms: NSObject {
    
    /// 二分法查询 必须是升序排列
    class public func BinarySearch(_ target:Int,_ source:Array<Int>)->Int
    {
        let start:Int = 0
        var hightIndex = source.count-1
        while start<=hightIndex {
            //中间值
            let mid = start+(hightIndex-start)/2
            //改变最大下标来缩小范围
            if target<source[mid]
            {
                hightIndex = mid-1
            }
            else if target>source[mid]
            {
                hightIndex = mid+1
            }
            else
            {
                return mid
            }
        }
        return -1
    }
    
}

//自定义三种集合对象
//基础 创建链表
class Node: NSObject {
    var item:Any?
    var next:Node?
    
}
class  DeNode: NSObject {
    var item:Any?
    var prev:DeNode?
    var next:DeNode?
}

//背包
class STBag: NSObject {
    fileprivate var first:Node?
    fileprivate var count:Int = 0
    
    public func add(_ item:Optional<Any>){
        if (first != nil)
        {
            let oldfirst = first
            first = Node.init()
            first!.item = item as AnyObject
            first!.next = oldfirst
        }
        else
        {
            first = Node()
            first?.item = item as AnyObject
        }
        count = count+1
    }
  
    func isEmpty() -> Bool {
        return count != 0
    }
    func size() -> Int {
        return count
    }
    
}
//栈
class STStack: NSObject {
    fileprivate var first:Node?
    fileprivate var count:Int = 0
    
    public func push(_ item:Optional<Any>){
        if (first != nil)
        {
            let oldfirst = first
            first = Node.init()
            first!.item = item as AnyObject
            first!.next = oldfirst
        }
        else
        {
            first = Node()
            first?.item = item as AnyObject
        }
        count  = count+1
    }
    
    public func peek()->Optional<Any>{
        return first?.item
    }
    
    
    
    public func pop() -> Any?{
        if (count>0)
        {
            let item = first?.item
            first = first?.next
            count = count - 1
            return item
        }
        else
        {
            return nil
        }
    }
    
    public  func isEmpty() -> Bool {
        return count != 0
    }
    public func size() -> Int {
        return count
    }
    
}

class STQueue: NSObject {
    fileprivate var fisrt:Node?
    fileprivate var last:Node?
    fileprivate var count:Int = 0
    
    public func enqueue(_ item:Optional<Any>){
        if (count != 0){
            let oldlast = last
            last?.item = item
            last?.next = nil
            oldlast?.next = last
            count = count + 1
        }
        else{
            let itemNode = Node()
            itemNode.item = item
            last = itemNode
            fisrt = last
            count = count + 1
        }
        
    }
    
    public func dequeue()->Node?{
        if (count != 0){
            let item = fisrt?.item
            fisrt = fisrt?.next
            count = count - 1
            return item as? Node
        }
        else {
            last = nil
            return nil
        }
        
        
    }
    
    
    public  func isEmpty() -> Bool {
        return count != 0
    }
    public func size() -> Int {
        return count
    }
    
}



class Deque: NSObject {
    private var count = 0
    private var head:DeNode?
    private var tail:DeNode?
    
    
    
    public func pushLeft(_ item:Any?){
        let node = DeNode()
        node.item = item
        if isEmpty(){
            head = node
            tail = node
        }else{
            node.next = head
            head?.prev = node
            head = node
        }
        count += 1
    }
    
    public func pushRight(_ item:Any?){
        let node = DeNode()
        node.item = item
        if isEmpty(){
            head = node
            tail = node
        }else{
            tail?.next = node
            node.prev = tail
            tail = node
            
        }
        count += 1
        
    }
    
    public func popLeft()->Any?{
        if isEmpty() {
            return nil
        }
        else{
            let item = head?.item
            if count == 1{
                head = nil
                tail = nil
            }
            else{
                
                head = head?.next
                head?.prev?.next = nil
                head?.prev = nil
                
            }
            count -= 1
            return item
        }
        
    }
    
    public func popRight()->Any?{
        if isEmpty() {
            return nil
        }
        else{
            let item = tail?.item
            if count == 1{
                head = nil
                tail = nil
            }
            else{
                tail = tail?.prev
                tail?.prev?.next = nil
                tail?.prev = nil
               
            }
            count -= 1
            return item
        }
        
    }
    
    
    public  func isEmpty() -> Bool {
        return count != 0
    }
    public func size() -> Int {
        return count
    }
    
}


