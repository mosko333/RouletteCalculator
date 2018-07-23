//
//  LayoutViewController.swift
//  RouletteCalculator
//
//  Created by Adam on 19/06/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit

class LayoutViewController: UIViewController {

    let layoutView = LayoutView()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutView.delegate = self
        layoutView.bottomBlockView.delegate = self
        self.view = layoutView
    }
}

extension LayoutViewController: LayoutViewDelegate {
    func addChipBtnTapped(at position: Position) {
        WinningNumberController.shared.addChip(position: position)
        // pass data to view from model controller
        // use datasource
        // TODO: - update this
        layoutView.reloadView()
    }
    
    func deleteOneChipBtnTapped(at position: Position) {
        WinningNumberController.shared.removeChip(position: position)
        layoutView.reloadView()
    }
}

extension LayoutViewController: BottomBackgroundViewDelegate {
    func clearButtonTapped() {
        for (position, _) in WinningNumberController.shared.winningNumber.numberOfChipsAtPosition {
            WinningNumberController.shared.winningNumber.numberOfChipsAtPosition[position] = 0
            guard let numberOfChips = WinningNumberController.shared.winningNumber.numberOfChipsAtPosition[position] else { return }
            layoutView.resetChips(withNumberOfChips: numberOfChips)
        }
    }
    
    
}
