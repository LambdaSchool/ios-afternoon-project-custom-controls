//
//  CustomControl.swift
//  CustomControls
//
//  Created by Kat Milton on 7/16/19.
//  Copyright © 2019 Kat Milton. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    var starsArray: [UILabel] = []
    
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        let spacing: CGFloat = 8.0
        var x: CGFloat = spacing
        
        for i in 0..<componentCount {
            
            
            let starLabel = UILabel()
            
            addSubview(starLabel)
            starLabel.tag = i + 1
            starLabel.frame.size = CGSize(width: componentDimension, height: componentDimension)
            starLabel.font = UIFont.boldSystemFont(ofSize: 32.0)
            starLabel.text = "☆"
            starLabel.textAlignment = .center
            
            starLabel.frame.origin = CGPoint(x: x , y: 0.0)
            
            x += componentDimension + spacing
            
            starsArray.append(starLabel)
            
            if starLabel.tag == 1 {
                starLabel.textColor = componentActiveColor
            } else {
                starLabel.textColor = componentInactiveColor
            }
            
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
}
