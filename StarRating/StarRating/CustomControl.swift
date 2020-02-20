//
//  CustomControl.swift
//  StarRating
//
//  Created by Enrique Gongora on 2/20/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    //MARK: - Variables
    var value: Int = 1
    var componentDimension: CGFloat = 40.0
    var componentCount = 5
    var componentActiveColor = UIColor.black
    var componentInactiveColor = UIColor.gray
    var starArray: [UILabel] = []
    
    // MARK: - Initializers
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    //MARK: - Functions
    func setup() {
        for number in 1...componentCount {
            let label = UILabel(frame: CGRect(x: CGFloat(number) * 8 + (CGFloat(number) - 1) * componentDimension, y: 0.0, width: componentDimension, height: componentDimension))
            label.translatesAutoresizingMaskIntoConstraints = false
            addSubview(label)
            label.tag = number
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = (number == 1) ? "🌟" : "☆"
            label.textAlignment = .center
            label.textColor = (number == 1) ? componentActiveColor : componentInactiveColor
            starArray.append(label)
        }
    }
    
    // This tells Auto Layout how big our custom control should be
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
}
