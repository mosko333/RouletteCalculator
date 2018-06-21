//
//  LayoutViewController.swift
//  RouletteCalculator
//
//  Created by Adam on 19/06/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit

class LayoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let layoutView = LayoutView()
        layoutView.delegate = self
        self.view = layoutView
    }
    
    //chipLeftSixLine.addTarget(self, action: #selector(twentyPercentButtonTapped), for: .touchUpInside)
    
    @objc func twentyPercentButtonTapped() {
        
    }
}

extension LayoutViewController: LayoutViewDelegate {
    
}
