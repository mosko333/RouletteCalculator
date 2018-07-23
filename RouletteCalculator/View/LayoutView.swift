//
//  LayoutView.swift
//  RouletteCalculator
//
//  Created by Adam on 19/06/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit

protocol LayoutViewDelegate: class {
    func addChipBtnTapped(at position: Position)
    func deleteOneChipBtnTapped(at position: Position)
}

class LayoutView: UIView {

    // MARK: - Contsraint Constants
    struct Constants {
        static let backgroundColorRed: UIColor = UIColor(named: "xcaBackgroundColorRed")!
        static let blockBackgroundTopViewHeight: CGFloat = 124
        static let blockBackgroundBottomViewHeight: CGFloat = 116
        static let chipHeightAndWidth: CGFloat = 83
        //static let dinamicHeight: CGFloat = (LayoutView().frame.height * 0.114)
        //static let outerStackYMulti: CGFloat = 0.114
        //static let leftStackXMulti: CGFloat = 0.103
        static let chipYOuterLineSpacing: CGFloat = 84
        static let chipXLeftLineSpacing: CGFloat = 73
        static let chipXMidLineSpacing: CGFloat = 162
        static let chipXRightLineSpacing: CGFloat = 250
        static let chipYTopSpacing: CGFloat = 306
        static let ovalXCenterLeftSpacing: CGFloat = 128
        static let ovalYCenterMidSpacing: CGFloat = 368
    }

    // MARK: - Properties
    let topBlockView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.backgroundColorRed
        return view
    }()

    //let backgroundScrollView: UIScrollView = UIScrollView(#imageLiteral(resourceName: "xcaBigLayout"))
    
    let bottomBlockView: BottomBackgroundView = BottomBackgroundView()
    weak var delegate: LayoutViewDelegate?

    let chipLeftSixLine = ChipButton(position: .leftSixLine)
    let chipMidStreet = ChipButton(position: .street)
    let chipRightSixLine = ChipButton(position: .RightSixLine)
    let chipTopLeftCorner = ChipButton(position: .leftTopCorner)
    let chipTopRightCorner = ChipButton(position: .rightTopCorner)
    let chipBottomLeftCorner = ChipButton(position: .leftBottomCorner)
    let chipBottomRightCorner = ChipButton(position: .rightBottomCorner)
    let chipTopSplit = ChipButton(position: .topSplit)
    let chipRightSplit = ChipButton(position: .rightSplit)
    let chipLeftSplit = ChipButton(position: .leftSplit)
    let chipBottomSplit = ChipButton(position: .bottomSplit)
    let chipStrightUp = ChipButton(position: .strightUp)

    override init(frame: CGRect) {
        super.init(frame: frame)
        chipLeftSixLine.addTarget(self, action: #selector(chipBtnTapped), for: .touchUpInside)
        chipLeftSixLine.addTarget(self, action: #selector(deleteOneChipBtnTapped), for: .touchUpOutside)
        chipMidStreet.addTarget(self, action: #selector(chipBtnTapped), for: .touchUpInside)
        chipMidStreet.addTarget(self, action: #selector(deleteOneChipBtnTapped), for: .touchUpOutside)
        chipRightSixLine.addTarget(self, action: #selector(chipBtnTapped), for: .touchUpInside)
        chipRightSixLine.addTarget(self, action: #selector(deleteOneChipBtnTapped), for: .touchUpOutside)
        chipTopLeftCorner.addTarget(self, action: #selector(chipBtnTapped), for: .touchUpInside)
        chipTopLeftCorner.addTarget(self, action: #selector(deleteOneChipBtnTapped), for: .touchUpOutside)
        chipTopRightCorner.addTarget(self, action: #selector(chipBtnTapped), for: .touchUpInside)
        chipTopRightCorner.addTarget(self, action: #selector(deleteOneChipBtnTapped), for: .touchUpOutside)
        chipBottomLeftCorner.addTarget(self, action: #selector(chipBtnTapped), for: .touchUpInside)
        chipBottomLeftCorner.addTarget(self, action: #selector(deleteOneChipBtnTapped), for: .touchUpOutside)
        chipBottomRightCorner.addTarget(self, action: #selector(chipBtnTapped), for: .touchUpInside)
        chipBottomRightCorner.addTarget(self, action: #selector(deleteOneChipBtnTapped), for: .touchUpOutside)
        chipTopSplit.addTarget(self, action: #selector(chipBtnTapped), for: .touchUpInside)
        chipTopSplit.addTarget(self, action: #selector(deleteOneChipBtnTapped), for: .touchUpOutside)
        chipRightSplit.addTarget(self, action: #selector(chipBtnTapped), for: .touchUpInside)
        chipRightSplit.addTarget(self, action: #selector(deleteOneChipBtnTapped), for: .touchUpOutside)
        chipLeftSplit.addTarget(self, action: #selector(chipBtnTapped), for: .touchUpInside)
        chipLeftSplit.addTarget(self, action: #selector(deleteOneChipBtnTapped), for: .touchUpOutside)
        chipBottomSplit.addTarget(self, action: #selector(chipBtnTapped), for: .touchUpInside)
        chipBottomSplit.addTarget(self, action: #selector(deleteOneChipBtnTapped), for: .touchUpOutside)
        chipStrightUp.addTarget(self, action: #selector(chipBtnTapped), for: .touchUpInside)
        chipStrightUp.addTarget(self, action: #selector(deleteOneChipBtnTapped), for: .touchUpOutside)

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = #imageLiteral(resourceName: "xcaLayout")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.insertSubview(backgroundImage, at: 0)
        
        //backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "xcaLayout"))
    }

    @objc func chipBtnTapped(_ sender: ChipButton) {

        guard let position = sender.position else { return }
        sender.numberCount += 1
        sender.count.text = "\(sender.numberCount)"
        sender.layer.opacity = 1
        delegate?.addChipBtnTapped(at: position)

    }
    
    @objc func deleteOneChipBtnTapped(_ sender: ChipButton) {
        
        guard sender.numberCount > 0,
            let position = sender.position else { return }
        sender.numberCount -= 1
        sender.count.text = "\(sender.numberCount)"
        if sender.numberCount == 0 {
            sender.layer.opacity = 0.011
        }
        delegate?.deleteOneChipBtnTapped(at: position)
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        addSubview(topBlockView)
        topBlockView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: Constants.blockBackgroundTopViewHeight)

        addSubview(bottomBlockView)
        bottomBlockView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, paddingBottom: 0, width: 0, height: Constants.blockBackgroundBottomViewHeight)

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

    func reloadView() {
        bottomBlockView.reloadView()
    }
    
    func resetChips(withNumberOfChips chipNumberCount: Int) {
        chipLeftSixLine.reloadValue(numberCount: chipNumberCount)
        chipLeftSixLine.layer.opacity = 0.011
        chipMidStreet.reloadValue(numberCount: chipNumberCount)
        chipMidStreet.layer.opacity = 0.011
        chipRightSixLine.reloadValue(numberCount: chipNumberCount)
        chipRightSixLine.layer.opacity = 0.011
        chipTopLeftCorner.numberCount = 0
        chipTopLeftCorner.count.text = "\(chipLeftSixLine.numberCount)"
        chipTopLeftCorner.layer.opacity = 0.011
        chipTopRightCorner.numberCount = 0
        chipTopRightCorner.count.text = "\(chipLeftSixLine.numberCount)"
        chipTopRightCorner.layer.opacity = 0.011
        chipBottomLeftCorner.numberCount = 0
        chipBottomLeftCorner.count.text = "\(chipLeftSixLine.numberCount)"
        chipBottomLeftCorner.layer.opacity = 0.011
        chipBottomRightCorner.numberCount = 0
        chipBottomRightCorner.count.text = "\(chipLeftSixLine.numberCount)"
        chipBottomRightCorner.layer.opacity = 0.011
        chipTopSplit.numberCount = 0
        chipTopSplit.count.text = "\(chipLeftSixLine.numberCount)"
        chipTopSplit.layer.opacity = 0.011
        chipRightSplit.numberCount = 0
        chipRightSplit.count.text = "\(chipLeftSixLine.numberCount)"
        chipRightSplit.layer.opacity = 0.011
        chipLeftSplit.numberCount = 0
        chipLeftSplit.count.text = "\(chipLeftSixLine.numberCount)"
        chipLeftSplit.layer.opacity = 0.011
        chipBottomSplit.numberCount = 0
        chipBottomSplit.count.text = "\(chipLeftSixLine.numberCount)"
        chipBottomSplit.layer.opacity = 0.011
        chipStrightUp.numberCount = 0
        chipStrightUp.count.text = "\(chipLeftSixLine.numberCount)"
        chipStrightUp.layer.opacity = 0.011
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
