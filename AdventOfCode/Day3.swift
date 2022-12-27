//
//  Day3.swift
//  AdventOfCode
//
//  Created by Karen Petrosyan on 12/25/22.
//

import Foundation

struct Day3 {
    // MARK: First Problem
    func itemsPrioritiesSum(rucksacks: [String]) {
        var result: Int = 0
        for rucksack in rucksacks {
            let (firstHalf, secondHalf) = rucksack.splitStringInHalf()
            if let matchedChar: String = self.findMatchLetters(firstHalf: firstHalf, secondHalf: secondHalf) {
                result += self.priority(of: matchedChar)
            }
        }
        print(result)
    }
    
    // MARK: Second Problem
    func badgeItemsSum(rucksacks: [String]) {
        var result: Int = 0
        for (index, _) in rucksacks.enumerated() {
            if index%3 == 0 {
                if index + 2 < rucksacks.count {
                    let firstRucksack = rucksacks[index]
                    let secondRucksack = rucksacks[index + 1]
                    let thirdRucksack = rucksacks[index + 2]
                    if let matchedChar: String = self.findMatchLetters(firstHalf: firstRucksack, secondHalf: secondRucksack, thirdHalf: thirdRucksack) {
                        result += self.priority(of: matchedChar)
                    }
                }
            } else {
                continue
            }
        }
        print(result)
    }
    
    // MARK: Private Methods
    private func findMatchLetters(firstHalf: String, secondHalf: String, thirdHalf: String? = nil) -> String? {
        for char1 in firstHalf {
            if let thirdHalf = thirdHalf {
                if secondHalf.contains(where: { $0 == char1 }) && thirdHalf.contains(where: { $0 == char1 }) {
                    return String(char1)
                }
            } else {
                if secondHalf.contains(where: { $0 == char1 }) {
                    return String(char1)
                }
            }
        }
        return nil
    }
    
    private func priority(of item: String) -> Int {
        let text = "abcdefghijklmnopqrstuvwxyz"
        if let range: Range<String.Index> = text.range(of: item) {
            return 1 + text.distance(from: text.startIndex, to: range.lowerBound)
        } else {
            let uppercasedText = text.uppercased()
            if let range: Range<String.Index> = uppercasedText.range(of: item) {
                return 27 + text.distance(from: uppercasedText.startIndex, to: range.lowerBound)
            }
        }
        return 0
    }
}

extension String {
   func splitStringInHalf() -> (firstHalf: String, secondHalf: String) {
       let index = self.index(self.startIndex, offsetBy: self.count/2)
       let firstHalf = String(self[..<index])
       let secondHalf = String(self.suffix(from: index))
       return (firstHalf, secondHalf)
    }
}
