//
//  ViewController.swift
//  AdventOfCode
//
//  Created by Karen Petrosyan on 12/6/22.
//

import UIKit

enum Day: String {
    case day1
    case day2
    case day3
    case day4
    case day5
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let data = self.dataFromFile(for: .day5) else { return }
        Day5().topCrates(input: data)
    }
    
    // MARK: Helpers
    
    private func dataFromFile(for day: Day) -> String? {
        let path = Bundle.main.path(forResource: day.rawValue, ofType: "txt")
        do {
            return try String(contentsOfFile: path ?? "", encoding: .ascii)
        } catch _ {
            return nil
        }
    }
    
    private func arrayFromFile(for day: Day) -> [String] {
        let path = Bundle.main.path(forResource: day.rawValue, ofType: "txt")
        var result: [String] = []
        let content: String
        do {
            content = try String(contentsOfFile: path ?? "", encoding: .ascii)
            result = content.components(separatedBy: .newlines)
        } catch _ {
        }
        return result
    }
}
