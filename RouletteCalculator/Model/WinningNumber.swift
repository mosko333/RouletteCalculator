//
//  WinningNumber.swift
//  RouletteCalculator
//
//  Created by Adam on 20/06/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import Foundation

@objc enum Position: Int {
    case leftSixLine, RightSixLine
    case street
    case leftTopCorner, rightTopCorner, leftBottomCorner, rightBottomCorner
    case topSplit, rightSplit, leftSplit, bottomSplit
    case strightUp
}

class WinningNumber {

    // MARK: - Properties

    let payoutDictionary: [Position: Int] = [.leftSixLine: 5,
                                              .RightSixLine: 5,
                                              .street: 11,
                                              .leftTopCorner: 8,
                                              .rightTopCorner: 8,
                                              .leftBottomCorner: 8,
                                              .rightBottomCorner: 8,
                                              .topSplit: 17,
                                              .leftSplit: 17,
                                              .rightSplit: 17,
                                              .bottomSplit: 17,
                                              .strightUp: 35]

    var numberOfChipsAtPosition: [Position: Int] = [.leftSixLine: 0,
                                                     .RightSixLine: 0,
                                                     .street: 0,
                                                     .leftTopCorner: 0,
                                                     .rightTopCorner: 0,
                                                     .leftBottomCorner: 0,
                                                     .rightBottomCorner: 0,
                                                     .topSplit: 0,
                                                     .leftSplit: 0,
                                                     .rightSplit: 0,
                                                     .bottomSplit: 0,
                                                     .strightUp: 0]

}
