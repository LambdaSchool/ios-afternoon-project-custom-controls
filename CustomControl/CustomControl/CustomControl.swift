//
//  CustomControl.swift
//  CustomControl
//
//  Created by Jeremy Taylor on 5/21/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import UIKit

@IBDesignable class CustomControl: UIControl {
    var value = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        var labels: [UILabel] = []
        for index in 1...componentCount {
            let x = CGFloat(index - 1)*(componentDimension + 8.0)
            let label = UILabel(frame: CGRect(x: x, y: 0.0, width: componentDimension, height: componentDimension))
            label.tag = index
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "✮"
            label.textAlignment = .center
            
            label.textColor = index == 1 ? componentActiveColor : componentInactiveColor
            
            addSubview(label)
            labels.append(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
}
