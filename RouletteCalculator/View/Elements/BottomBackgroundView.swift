//
//  BottomBackgroundBlock.swift
//  RouletteCalculator
//
//  Created by Adam on 20/06/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit
class BottomBackgroundView: UIView {

    
    // MARK: - Constants
    struct Constants {
        static let backgroundColorRed: UIColor = LayoutView.Constants.backgroundColorRed
        static let displayFontSize: CGFloat = 28
        static let displayWidth: CGFloat = 216
        static let displeyCornerRadius: CGFloat = 3
    }
    
    // MARK: - Properties
    
    let clearBtn: UIButton = {
        var button = UIButton()
        button.contentMode = .scaleAspectFill
        button.setImage(#imageLiteral(resourceName: "xcaClearBtn").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        return button
    }()
    
    let displayScreenLable: UILabel = {
        let label = UILabel()
        label.text = "00000"
        label.font = UIFont.boldSystemFont(ofSize: Constants.displayFontSize)
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        

        
//        clearBtn.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        //clearBtn.rightAnchor.constraint(equalTo: displayScreenLable.leftAnchor, constant: 16).isActive = true
//        clearBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
//        clearBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        addSubview(displayScreenLable)
        displayScreenLable.translatesAutoresizingMaskIntoConstraints = false
        displayScreenLable.textAlignment = .right
//        displayScreenLable.layoutMargins = UIEdgeInsets(top: 4, left: 16, bottom: 4, right: 16)
        displayScreenLable.backgroundColor = .white
        displayScreenLable.layer.masksToBounds = true
        displayScreenLable.layer.cornerRadius = Constants.displeyCornerRadius
        displayScreenLable.widthAnchor.constraint(equalToConstant: Constants.displayWidth).isActive = true
        displayScreenLable.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        displayScreenLable.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
        addSubview(clearBtn)
        clearBtn.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 33, paddingLeft: 33, paddingRight: 0, paddingBottom: 0, width: 50, height: 50)
    }
    
    
    
    func setup() {
        self.backgroundColor = Constants.backgroundColorRed
    }
    
}

