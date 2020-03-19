//
//  CustomControl.swift
//  Star Rating
//
//  Created by Mark Gerrior on 3/19/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    let componentSpace: CGFloat = 8.0
    
    var stars = [UILabel]()

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        var spacer: CGFloat = 0.0
        
        for count in 1...5 {
            let newStar = UILabel()
            newStar.tag = count
            
            // Place them in the view
            spacer += componentSpace
            newStar.frame = CGRect(origin: CGPoint(x: spacer, y: 0),
                                   size: CGSize(width: componentDimension, height: componentDimension))
            spacer += componentDimension

            // Set the font
            newStar.font = .boldSystemFont(ofSize: 32.0)
            newStar.text = "★" // ☆
            newStar.textAlignment = .center
            newStar.textColor = count > 1 ? componentInactiveColor : componentActiveColor
            
            addSubview(newStar)
            stars.append(newStar)
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
}
