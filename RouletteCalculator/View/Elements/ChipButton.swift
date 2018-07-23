//
//  ChipButton.swift
//  RouletteCalculator
//
//  Created by Adam on 20/06/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit

class ChipButton: UIButton {

    // MARK: - Contsraint Constants
    struct Constants {
        static let countFontSize: CGFloat = 28
    }

    // MARK: - Properties
    var numberCount: Int = 0
    var position: Position?

    lazy var count: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(numberCount)"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: label.font.fontName, size: Constants.countFontSize)
        return label
    }()

    // MARK: - Inits

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    convenience init(position: Position) {
        self.init(type: .system)
        self.position = position
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        addSubview(count)
        count.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        count.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

    func setup() {
        self.contentMode = .scaleAspectFill
        self.setImage(#imageLiteral(resourceName: "xcaChip").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        self.layer.opacity = 0.011
    }
    
    func reloadValue(numberCount: Int) {
        self.numberCount = numberCount
        self.count.text = "\(numberCount)"
    }

}
