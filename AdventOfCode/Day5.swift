//
//  Day5.swift
//  AdventOfCode
//
//  Created by Karen Petrosyan on 12/26/22.
//

import Foundation

struct Day5 {
    func topCrates(input: String) {
        let clearedInput: String = self.clearInput(input)
        if let (crates, moves) = self.separateCratesFromMoves(input: clearedInput) {
            if var cratesArray = self.getCrates(input: crates) {
                let movesArray = self.getMovesArray(input: moves)
                for move in movesArray {
                    let (movesCount, from, to) = move
                    let fromCrate = cratesArray[from - 1]
                    var fromCrateCopy = cratesArray[from - 1]
                    var toCrate = cratesArray[to - 1]
                    var i = 0
                    while i < movesCount {
                        toCrate.insert(fromCrate[i], at: 0)
                        fromCrateCopy.remove(at: 0)
                        i += 1
                    }
                    cratesArray[from - 1] = fromCrateCopy
                    cratesArray[to - 1] = toCrate
                }
                var cratesResult: String = ""
                for crate in cratesArray {
                    cratesResult += crate.first ?? ""
                }
                print(cratesResult)
            }
        }
    }
    
    // MARK: Private Methods
    private func clearInput(_ input: String) -> String {
        var clearInput = input.replacingOccurrences(of: "move", with: "")
        clearInput = clearInput.replacingOccurrences(of: "from", with: "")
        clearInput = clearInput.replacingOccurrences(of: "to", with: "")
        clearInput = clearInput.replacingOccurrences(of: " ", with: "-")
        clearInput = clearInput.replacingOccurrences(of: "[", with: "")
        clearInput = clearInput.replacingOccurrences(of: "]", with: "")
        return clearInput
    }
    
    private func separateCratesFromMoves(input: String) -> (String, String)? {
        let array = input.components(separatedBy: "\n\n")
        if array.count == 2 {
            return (array[0], array[1])
        }
        return nil
    }
    
    private func getCrates(input: String) -> [[String]]? {
        var result: [[String]] = []
        let array = input.components(separatedBy: .newlines)
        if array.count > 0 {
            let lastItem = array[array.count - 1]
            let clearedInput = lastItem.components(separatedBy: "---")
            result = Array(repeating: [], count: clearedInput.count)
        } else {
            return nil
        }
        for (i, line) in array.enumerated() {
            if i == array.count - 1 {
                break
            }
            var index: Int = 0
            var symbolsCount: Int = 0
            for char in line {
                if char != "-" {
                    result[index].append(String(char))
                    index += 1
                    symbolsCount = 0
                } else {
                    symbolsCount += 1
                    if symbolsCount == 4 {
                        symbolsCount = 0
                        index += 1
                    }
                }
            }
        }
        return result
    }
    
    private func getMovesArray(input: String) -> [(Int, Int, Int)] {
        var result: [(Int, Int, Int)] = []
        let moves = input.components(separatedBy: .newlines)
        for move in moves {
            let separatedMove = move.components(separatedBy: "-").filter { item in
                !item.isEmpty
            }
            if separatedMove.count == 3 {
                let movesCount: Int = Int(separatedMove[0]) ?? 0
                let from: Int = Int(separatedMove[1]) ?? 0
                let to: Int = Int(separatedMove[2]) ?? 0
                result.append((movesCount, from, to))
            }
        }
        return result
    }
}
