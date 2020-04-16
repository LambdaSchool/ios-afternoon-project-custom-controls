//
//  CustomControl.swift
//  StarRating
//
//  Created by Chris Dobek on 4/16/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    // Components
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    private var components: [UILabel] = []
    
    //Auto Layout
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = .clear
        frame = CGRect(origin: .zero, size: intrinsicContentSize)
        for index in 1...componentCount {
            
            // Creating a label
            let label = UILabel()
            addSubview(label)
            components.append(label)
            
            // Label Layout
            let offset = CGFloat(index - 1) * componentDimension + CGFloat(index) * 8.0
            let origin = CGPoint(x: offset, y: 0)
            let componentSize = CGSize(width: componentDimension, height: componentDimension)
            label.frame = CGRect(origin: origin, size: componentSize)
            label.tag = index
            
            //Set Up Label
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "✮"
            label.textAlignment = .center
            switch index {
            case 1:
                label.textColor = componentActiveColor
            default:
                label.textColor = componentInactiveColor
            }
        }
    }
}
