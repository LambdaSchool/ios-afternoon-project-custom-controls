//
//  CustomControl.swift
//  StarRating
//
//  Created by Chad Parker on 4/16/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40
    private let componentCount = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        var labels: [UILabel] = []
        for i in 1...5 {
            let label = UILabel()
            label.tag = i
            label.font = .boldSystemFont(ofSize: 32)
            label.text = "⭑"
            label.textAlignment = .center
            label.textColor = (i == 1) ? componentActiveColor : componentInactiveColor
            label.frame = CGRect(x: 8 + CGFloat(i-1) * (componentDimension + 8), y: 0, width: componentDimension, height: componentDimension)
            
            addSubview(label)
            labels.append(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension + 5)
    }
}
