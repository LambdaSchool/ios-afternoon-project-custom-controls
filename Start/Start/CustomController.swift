//
//  CustomController.swift
//  Start
//
//  Created by Christopher Aronson on 5/14/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class CustomController: UIControl {
    var value = 1
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
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
        var labels: [UILabel] = []
        
        for tag in 1...5 {
            let label = UILabel()
            label.tag = tag
            label.font.withSize(30.0)
            label.text = "★"
            label.textAlignment = .center
            addSubview(label)
            labels.append(label)
        }
        
        for label in labels {
            if label.tag == 1 {
                label.frame = CGRect(x: 16.0, y: 0.0, width: componentDimension, height: componentDimension)
                label.textColor = componentActiveColor
            } else if label.tag == 2 {
                label.frame = CGRect(x: componentDimension + 16.0, y: 0.0, width: componentDimension, height: componentDimension)
                label.textColor = componentInactiveColor
            } else if label.tag == 3 {
                label.frame = CGRect(x: (componentDimension * 2) + 16.0, y: 0.0, width: componentDimension, height: componentDimension)
                label.textColor = componentInactiveColor
            } else if label.tag == 4 {
                label.frame = CGRect(x: (componentDimension * 3) + 16.0, y: 0.0, width: componentDimension, height: componentDimension)
                label.textColor = componentInactiveColor
            } else if label.tag == 5 {
                label.frame = CGRect(x: (componentDimension * 4) + 16.0, y: 0.0, width: componentDimension, height: componentDimension)
                label.textColor = componentInactiveColor
            }
            
        }
    }
}
