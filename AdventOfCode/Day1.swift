//
//  Day1.swift
//  AdventOfCode
//
//  Created by Karen Petrosyan on 12/19/22.
//

import Foundation

struct Day1 {
    static func firstRound(array: [String]) {
        let array = array
        var sum = 0
        var result = 0
        for i in 0...array.count-1 {
            let item = array[i]
            if !item.isEmpty {
                sum += Int(item) ?? 0
            } else {
                if sum > result {
                    result = sum
                }
                sum = 0
            }
        }
        print(result)
    }
    
    static func secondRound(array: [String]) {
        var resultArray: [Int] = []
        var sum = 0
        for item in array {
            if !item.isEmpty {
                sum += Int(item) ?? 0
            } else {
                resultArray.append(sum)
                sum = 0
            }
        }
        let sortedArray = resultArray.sorted(by: { first, second in
            return first > second
        })
        print(sortedArray[0] + sortedArray[1] + sortedArray[2])
    }
}
