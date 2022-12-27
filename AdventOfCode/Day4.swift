//
//  Day4.swift
//  AdventOfCode
//
//  Created by Karen Petrosyan on 12/25/22.
//

import Foundation

struct Day4 {
    func containedPairs(pairsList: [String]) {
        var result = 0
        for line in pairsList {
            if let (firstPairString, secondPairString) = self.pairsString(line) {
                if let pairBounds1 = self.pairBounds(pair: firstPairString),
                   let pairBounds2 = self.pairBounds(pair: secondPairString) {
                    print(pairBounds1)
                    print(pairBounds2)
                    if self.isContainsPairsEachOther(firstPair: pairBounds1, secondPair: pairBounds2) {
                        result += 1
                    }
                }
            }
        }
        print(result)
    }
    
    func overlapedPairs(pairsList: [String]) {
        var result = 0
        for line in pairsList {
            if let (firstPairString, secondPairString) = self.pairsString(line) {
                if let pairBounds1 = self.pairBounds(pair: firstPairString),
                   let pairBounds2 = self.pairBounds(pair: secondPairString) {
                    print(pairBounds1)
                    print(pairBounds2)
                    if self.isContainsOverlapPairs(firstPair: pairBounds1, secondPair: pairBounds2) {
                        result += 1
                    }
                }
            }
        }
        print(result)
    }
    
    // MARK: Private Methods
    private func pairsString(_ line: String) -> (String, String)? {
        let pairArray = line.components(separatedBy: ",")
        if pairArray.count == 2 {
            return (pairArray[0], pairArray[1])
        }
        return nil
    }
    
    private func pairBounds(pair: String) -> (Int, Int)? {
        let pairArray = pair.components(separatedBy: "-")
        if pairArray.count == 2,
           let first = Int(pairArray[0]),
           let second = Int(pairArray[1]) {
            return (first, second)
        }
        return nil
    }
    
    private func isContainsPairsEachOther(firstPair: (Int, Int), secondPair: (Int, Int)) -> Bool {
        if (firstPair.0 >= secondPair.0 && firstPair.1 <= secondPair.1) ||
            (firstPair.0 <= secondPair.0 && firstPair.1 >= secondPair.1) {
            return true
        }
        return false
    }
    
    private func isContainsOverlapPairs(firstPair: (Int, Int), secondPair: (Int, Int)) -> Bool {
        if (firstPair.0 <= secondPair.0 && firstPair.1 >= secondPair.0) ||
            (secondPair.0 <= firstPair.0 && secondPair.1 >= firstPair.0) {
            return true
        }
        return false
    }
}
