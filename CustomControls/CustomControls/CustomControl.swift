//
//  CustomControl.swift
//  CustomControls
//
//  Created by Ciara Beitel on 9/12/19.
//  Copyright © 2019 Ciara Beitel. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    var labels: [UILabel] = []
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        for i in 1...5 {
            let ratingLabel = UILabel(frame: CGRect(x: 0, y: 0, width: componentDimension, height: componentDimension))
            ratingLabel.center = CGPoint(x: frame.midX, y: frame.midY)
            ratingLabel.textAlignment = .center
            ratingLabel.text = "✪"
            ratingLabel.textColor = componentInactiveColor
            ratingLabel.tag = i
            ratingLabel.font = .boldSystemFont(ofSize: 32)
            addSubview(ratingLabel)
            labels.append(ratingLabel)
        }
        labels.first?.textColor = componentActiveColor
    }
}















//let stackView = UIStackView()
//stackView.axis = NSLayoutConstraint.Axis.horizontal
//stackView.distribution  = UIStackView.Distribution.equalSpacing
//stackView.alignment = UIStackView.Alignment.center
//stackView.spacing = 8.0
//
//stackView.addArrangedSubview(ratingLabel)
//addSubview(stackView)
