//
//  WinningNumberController.swift
//  RouletteCalculator
//
//  Created by Adam on 20/06/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import Foundation

class WinningNumberController {

    static let shared = WinningNumberController()
    var winningNumber = WinningNumber()

    func addChip(position: Position) {
        guard var value = winningNumber.numberOfChipsAtPosition[position] else { return }
        value += 1
        winningNumber.numberOfChipsAtPosition[position] = value
    }
    
    func removeChip(position: Position) {
        guard var value = winningNumber.numberOfChipsAtPosition[position] else { return }
        value -= 1
        winningNumber.numberOfChipsAtPosition[position] = value
    }

    func getTotal() -> Int {
        var totalPayout = 0
        for (position, numberOfChips) in winningNumber.numberOfChipsAtPosition {
            guard let odds = winningNumber.payoutDictionary[position] else { return 0 }
            totalPayout += numberOfChips * odds
        }
        return totalPayout
    }
}
