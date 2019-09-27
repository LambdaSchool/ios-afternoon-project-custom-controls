//
//  CustomControl.swift
//  Star Rating
//
//  Created by Vici Shaweddy on 9/26/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    private let componentDimension: CGFloat = 40.0
    private let componentCount: CGFloat = 5.0
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    private var labels: [UILabel] = []
    
    var value: Int = 1
    
    required init?(coder aCoder:NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    func setup() {
        for i in 1...5 {
            let label = UILabel()
            label.text = "⭐️"
            label.tag = i
            self.addSubview(label)
            self.labels.append(label)
            
            let x = CGFloat(i) * 8.0 + (CGFloat(i - 1) * componentDimension)
            label.frame = CGRect(x: x, y: 0, width: componentDimension, height: componentDimension)
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.textAlignment = .center
        }

    }
}
