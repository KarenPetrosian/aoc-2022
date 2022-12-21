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
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Day1.firstRound(array: self.arrayFromFile(for: .day1))
    }
    
    // MARK: Helpers
    
    private func arrayFromFile(for day: Day) -> [String] {
        let path = Bundle.main.path(forResource: day.rawValue, ofType: "txt")
        var result: [String] = []
        let content: String
        do {
            content = try String(contentsOfFile: path ?? "", encoding: .ascii)
            result = content.components(separatedBy: "\n")
        } catch _ {
        }
        return result
    }
}
