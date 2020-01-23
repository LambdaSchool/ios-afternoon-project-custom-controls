//
//  CustomControl.swift
//  Star Rating
//
//  Created by Kenny on 1/23/20.
//  Copyright © 2020 Hazy Studios. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40
    private let componentSpacing: CGFloat = 8
    private let componentCount = 6
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    private let fontSize: CGFloat = 32
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        for i in 1...componentCount {
            //setup label
            let label = UILabel()
            label.tag = i
            addSubview(label)
            //set label's position
            var position = CGPoint(x: (i-1)*Int(componentDimension) + Int(componentSpacing*2), y: 0)
            if i == 1 {
                position = CGPoint(x: componentSpacing, y: 0)
            }
            label.frame = CGRect(origin: position, size: CGSize(width: componentDimension, height: componentDimension))
            
            label.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
            label.text = "☆"
            label.textAlignment = .center
            
            if i == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * componentSpacing
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
}
