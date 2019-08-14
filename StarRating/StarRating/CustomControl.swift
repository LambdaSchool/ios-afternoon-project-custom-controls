//
//  CustomControl.swift
//  StarRating
//
//  Created by Bradley Yin on 8/13/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    var value = 1
    
    private let componentDimension : CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    func setup() {
        var labels: [UILabel] = []
        var xPostion: CGFloat = 8.0
        for i in 1...5 {
            let newLabel = UILabel(frame: CGRect(x: xPostion, y: 0.0, width: componentDimension, height: componentDimension))
            xPostion += (componentDimension + 8.0)
            newLabel.tag = i
            newLabel.font = newLabel.font.withSize(32.0)
            newLabel.text = "☆"
            newLabel.textAlignment = .center
            if i == 1 {
                newLabel.textColor = componentActiveColor
            } else {
                newLabel.textColor = componentInactiveColor
            }
            self.addSubview(newLabel)
            labels.append(newLabel)
        }
    }
}
