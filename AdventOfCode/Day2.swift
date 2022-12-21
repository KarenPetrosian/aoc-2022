//
//  Day2.swift
//  AdventOfCode
//
//  Created by Karen Petrosyan on 12/18/22.
//

import Foundation

enum Hand1: String {
    case stone = "A"
    case paper = "B"
    case scissors = "C"
}

enum Hand2: String {
    case stone = "X"
    case paper = "Y"
    case scissors = "Z"
}

enum Game {
    case win
    case draw
    case defeat
}

extension Game: RawRepresentable {
    init?(rawValue: (Hand1, Hand2)) {
        switch rawValue {
        case (.stone, .stone): self = .draw
        case (.stone, .paper): self = .win
        case (.stone, .scissors): self = .defeat
            
        case (.paper, .stone): self = .defeat
        case (.paper, .paper): self = .draw
        case (.paper, .scissors): self = .win
            
        case (.scissors, .stone): self = .win
        case (.scissors, .paper): self = .defeat
        case (.scissors, .scissors): self = .draw
        }
    }
    
    var rawValue: (Hand1, Hand2) {
        switch self {
        case .win: return (.stone, .paper)
        case .draw: return (.stone, .stone)
        case .defeat: return (.stone, .scissors)
        }
    }
    
    func resultForGame1(hand: Hand2) -> Int {
        var result = 0
        switch hand {
        case .stone:
            result = 1
        case .paper:
            result = 2
        case .scissors:
            result = 3
        }
        switch self {
        case .win:
            result += 6
        case .draw:
            result += 3
        default:
            break
        }
        return result
    }
    
    func scoreForHand(hand2: Hand2) -> Int {
        switch hand2 {
        case .stone:
            return 0
        case .paper:
            return 3
        case .scissors:
            return 6
        }
    }
    
    func resultForGame2(hand1: Hand1, hand2: Hand2) -> Int {
        var result = 0
        switch hand2 {
        case .stone:
            switch hand1 {
            case .stone:
                result = 3
            case .paper:
                result = 1
            case .scissors:
                result = 2
            }
        case .paper:
            switch hand1 {
            case .stone:
                result = 1
            case .paper:
                result = 2
            case .scissors:
                result = 3
            }
        case .scissors:
            switch hand1 {
            case .stone:
                result = 2
            case .paper:
                result = 3
            case .scissors:
                result = 1
            }
        }
        result += self.scoreForHand(hand2: hand2)
        return result
    }
}

class Day2 {
    static func firstRound(array: [String]) {
        var result = 0
        for item in array {
            if !item.isEmpty {
                let arrayHands = item.components(separatedBy: " ")
                if let hand1 = Hand1(rawValue: arrayHands[0]),
                   let hand2 = Hand2(rawValue: arrayHands[1]),
                   let game = Game(rawValue: (hand1, hand2)){
                    result += game.resultForGame1(hand: hand2)
                }
            }
        }
        print(result)
    }

    static func secondRound(array: [String]) {
        var result = 0
        for item in array {
            if !item.isEmpty {
                let arrayHands = item.components(separatedBy: " ")
                if let hand1 = Hand1(rawValue: arrayHands[0]),
                   let hand2 = Hand2(rawValue: arrayHands[1]),
                   let game = Game(rawValue: (hand1, hand2)){
                    result += game.resultForGame2(hand1: hand1, hand2: hand2)
                }
            }
        }
        print(result)
    }
}
