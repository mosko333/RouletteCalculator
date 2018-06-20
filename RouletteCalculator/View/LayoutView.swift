//
//  LayoutView.swift
//  RouletteCalculator
//
//  Created by Adam on 19/06/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit


class LayoutView: UIView {
    
    // MARK: - Contsraint Constants
    struct Constants {
        static let chipHeightAndWidth: CGFloat = 83
        static let chipYOuterLineSpacing: CGFloat = 84
        static let chipXLeftLineSpacing: CGFloat = 73
        static let chipXMidLineSpacing: CGFloat = 162
        static let chipXRightLineSpacing: CGFloat = 250
        static let chipYTopSpacing: CGFloat = 306
        static let ovalXCenterLeftSpacing: CGFloat = 128
        static let ovalYCenterMidSpacing: CGFloat = 368
    }
    
    // MARK: - Properties
    let chipLeftSixLine: UIButton = {
        let button = UIButton(type: .system)
        button.contentMode = .scaleAspectFill
        button.setImage(#imageLiteral(resourceName: "xcaChip").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        return button
    }()
    
    let chipMidStreet: UIButton = {
        let button = UIButton(type: .system)
        button.contentMode = .scaleAspectFill
        button.setImage(#imageLiteral(resourceName: "xcaChip").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        return button
    }()
    
    let chipRightSixLine: UIButton = {
        let button = UIButton(type: .system)
        button.contentMode = .scaleAspectFill
        button.setImage(#imageLiteral(resourceName: "xcaChip").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        return button
    }()
    
    let chipTopLeftCorner: UIButton = {
        let button = UIButton(type: .system)
        button.contentMode = .scaleAspectFill
        button.setImage(#imageLiteral(resourceName: "xcaChip").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        return button
    }()
    
    let chipTopRightCorner: UIButton = {
        let button = UIButton(type: .system)
        button.contentMode = .scaleAspectFill
        button.setImage(#imageLiteral(resourceName: "xcaChip").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        return button
    }()
    
    let chipBottomLeftCorner: UIButton = {
        let button = UIButton(type: .system)
        button.contentMode = .scaleAspectFill
        button.setImage(#imageLiteral(resourceName: "xcaChip").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        return button
    }()
    
    let chipBottomRightCorner: UIButton = {
        let button = UIButton(type: .system)
        button.contentMode = .scaleAspectFill
        button.setImage(#imageLiteral(resourceName: "xcaChip").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        return button
    }()
    
    let chipTopSplit: UIButton = {
        let button = UIButton(type: .system)
        button.contentMode = .scaleAspectFill
        button.setImage(#imageLiteral(resourceName: "xcaChip").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        return button
    }()
    
    let chipRightSplit: UIButton = {
        let button = UIButton(type: .system)
        button.contentMode = .scaleAspectFill
        button.setImage(#imageLiteral(resourceName: "xcaChip").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        return button
    }()
    
    let chipLeftSplit: UIButton = {
        let button = UIButton(type: .system)
        button.contentMode = .scaleAspectFill
        button.setImage(#imageLiteral(resourceName: "xcaChip").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        return button
    }()
    
    let chipBottomSplit: UIButton = {
        let button = UIButton(type: .system)
        button.contentMode = .scaleAspectFill
        button.setImage(#imageLiteral(resourceName: "xcaChip").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
        return button
    }()
    
    let chipStrightUp: UIButton = ChipButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "xcaLayout"))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //        addSubview(chipLeftSixLine)
        //        chipLeftSixLine.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: Constants.chipYOuterLineSpacing, paddingLeft: Constants.chipXLeftLineSpacing, paddingRight: 0, paddingBottom: 0, width: Constants.chipHeightAndWidth, height: Constants.chipHeightAndWidth)
        //
        //        addSubview(chipMidStreet)
        //        chipMidStreet.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: Constants.chipYOuterLineSpacing, paddingLeft: Constants.chipXMidLineSpacing, paddingRight: 0, paddingBottom: 0, width: Constants.chipHeightAndWidth, height: Constants.chipHeightAndWidth)
        //
        //        addSubview(chipRightSixLine)
        //        chipRightSixLine.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: Constants.chipYOuterLineSpacing, paddingLeft: Constants.chipXRightLineSpacing, paddingRight: 0, paddingBottom: 0, width: Constants.chipHeightAndWidth, height: Constants.chipHeightAndWidth)
        
        let outerStackView = UIStackView(arrangedSubviews: [chipLeftSixLine, chipMidStreet, chipRightSixLine])
        outerStackView.distribution = .fillEqually
        addSubview(outerStackView)
        outerStackView.spacing = 6
        outerStackView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: Constants.chipYOuterLineSpacing, paddingLeft: Constants.chipXLeftLineSpacing, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        
        let topStackView = UIStackView(arrangedSubviews: [chipTopLeftCorner, chipTopSplit, chipTopRightCorner])
        topStackView.distribution = .fillEqually
        addSubview(topStackView)
        topStackView.spacing = 6
        
        let midStackView = UIStackView(arrangedSubviews: [chipLeftSplit, chipStrightUp, chipRightSplit])
        midStackView.distribution = .fillEqually
        addSubview(midStackView)
        midStackView.spacing = 6
        
        let bottomStackView = UIStackView(arrangedSubviews: [chipBottomLeftCorner, chipBottomSplit, chipBottomRightCorner])
        bottomStackView.distribution = .fillEqually
        addSubview(bottomStackView)
        bottomStackView.spacing = 6
        
        let mainStackView = UIStackView(arrangedSubviews: [topStackView, midStackView, bottomStackView])
        mainStackView.axis = .vertical
        mainStackView.distribution = .fillEqually
        addSubview(mainStackView)
        mainStackView.spacing = 23
        mainStackView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: Constants.chipYTopSpacing, paddingLeft: Constants.chipXLeftLineSpacing, paddingRight: 0, paddingBottom: 0, width: 0, height: 0)
        
        
    }
    
    
    
    
    //    func assignbackground(){
    //        let background = #imageLiteral(resourceName: "xcaBigLayout")
    //
    //        var imageView : UIImageView!
    //        imageView = UIImageView(frame: CGRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>))
    //        imageView.contentMode =  UIViewContentMode.scaleAspectFill
    //        imageView.clipsToBounds = true
    //        imageView.image = background
    //        imageView.center = view.center
    //        imageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: -311, paddingLeft: -371, paddingRight: 2277, paddingBottom: 904, width: 1214, height: 2647)
    //        view.addSubview(imageView)
    //        self.view.sendSubview(toBack: imageView)
    //    }
    
    
}

class ChipButton: UIButton {
    
    // MARK: - Properties
    let createNewAccLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "test"
        label.numberOfLines = 1
        label.textAlignment = .center
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
    }
    
    
    func setup() {
        self.contentMode = .scaleAspectFill
        self.setImage(#imageLiteral(resourceName: "xcaChip").withRenderingMode(UIImageRenderingMode.alwaysOriginal), for: .normal)
    }
    
}
