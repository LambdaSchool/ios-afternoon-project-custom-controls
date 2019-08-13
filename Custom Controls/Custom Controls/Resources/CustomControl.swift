//
//  CustomControl.swift
//  Custom Controls
//
//  Created by Jake Connerly on 8/13/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    var value: Int = 1
    
    let componentDimension: CGFloat     = 40.0
    let componentCount: Int             = 5
    let componentActiveColor: UIColor   = .black
    let componentInactiveColor: UIColor = .darkGray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        
        var starArray: Array<UILabel> = []
        var spacer: CGFloat = 8.0
        
        for index in 1...componentCount {
            let label = UILabel(frame: CGRect(x: spacer, y: 0, width: componentDimension, height: componentDimension))
            spacer += 8 + componentDimension
            label.text = "★"
            label.font = .boldSystemFont(ofSize: 32.0)
            label.tag = index
            
            if index == 1 {
                label.textColor = componentActiveColor
            }else {
                label.textColor = componentInactiveColor
            }
            
            starArray.append(label)
            self.addSubview(label)
        }
    }
    
}

