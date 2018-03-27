//
//  Algorithms+sort.swift
//  Algorithms
//
//  Created by 石函东 on 2018/3/5.
//  Copyright © 2018年 石函东. All rights reserved.
//

import Foundation

extension Algorithms{
    //插入排序
    class public func insert_sort(_ array:NSArray) -> NSArray{
        let totalArray:NSMutableArray = NSMutableArray.init()
        for i in 0...array.count-1{
            //取元素
            let key:Double = array[i] as! Double
            if (i==0 || key>totalArray.lastObject as!Double){
                totalArray.add(key)
            }
            else {
                
                
                totalArray.add(totalArray.lastObject as!Double)
                var j:Int = totalArray.count-1 //下标
                repeat{
                    j -= 1
                    totalArray[j+1] = totalArray[j]
                   
                }
                while(j>0&&key<totalArray[j] as! Double)
                
                if key<totalArray[j] as! Double{
                    totalArray[j] = key
                }
                else{
                    totalArray[j+1] = key
                }
            }
        }
        return NSArray.init(array: totalArray)
        
        
    }
    
    class public func insertSort(_ source:NSArray) ->NSArray{
        let tmpArray = NSMutableArray.init(array: source)
        for i in 1...tmpArray.count-1
        {

            for j in (1...i).reversed(){
                if !(tmpArray[j] as!Double>tmpArray[j-1]as!Double) {
                    let t = tmpArray[j-1]
                    tmpArray[j-1] = tmpArray[j]
                    tmpArray[j] = t
                }
            }
        }
        return NSArray.init(array: tmpArray)
    }
    //选择排序
    class public func selection_sort(_ source:NSArray) ->NSArray{
        let tmpArray = NSMutableArray.init(array: source)
        for i in 0...tmpArray.count-1{
            var min = i //最小值下标
            //todo
            if min+1 <= tmpArray.count-1 {
                for j in i+1...tmpArray.count-1{
                    let minx = tmpArray[min] as!Double
                    let next = tmpArray[j]  as!Double
                    if minx > next{
                        min = j
                    }
                }
                tmpArray.exchangeObject(at: i, withObjectAt: min)
            }
            
        }
        return tmpArray
    }
    
    //希尔排序
    class public func shell_sort(_ source:NSArray) -> NSArray {
        let tmpArray = NSMutableArray.init(array: source)
        //控制范围
        let area = 3
        //范围控制计数
        var h = 1
        while h < source.count/area {
            h = area * h + 1
        }
        
        while h >= 1 {
            for i in h...source.count-1 {
                for j in stride(from: i, through: h, by: -h) {
                    self.less(tmpArray, j, j-h)
                }
            }
            //当执行完h = 1时，排序完成
            h = h/area
        }
        
        return tmpArray
    }
    
  
}

extension Algorithms {
    class fileprivate func less(_ array:NSMutableArray,_ first:Int,_ second:Int) {
        //递增序列
        let now = array[first] as! Double
        let last = array[second] as! Double
        
        if first > second {
            if now < last {
                array.exchangeObject(at: first, withObjectAt: second)
            }
        }
        
        if first < second {
            if last < now {
                array.exchangeObject(at: first, withObjectAt: second)
            }
        }
        
    }
    
}


