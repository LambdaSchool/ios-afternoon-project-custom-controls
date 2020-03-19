//
//  CustomControl.swift
//  Star Rating
//
//  Created by Nichole Davidson on 3/19/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import Foundation
import UIKit

// This property is API-facing, clients will be able to see it.
// Establishes your control as a value-providing (and value-changing) type.
class CustomControl: UIControl {
    
    // MARK: - Properties
    
    var starArray: [UILabel] = []
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    // MARK: - Initializers
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
        
    }
    
    func setup() {
        let star = UILabel(frame: CGRect(x: 8.0, y: 0, width: componentDimension, height: componentDimension))
         
         for i in 0...5 {
            star.layoutMargins = UIEdgeInsets(top: 0.0, left: 4.0, bottom: 0.0, right: 4.0)
            star.textAlignment = .center
            star.text = "⭐️"
            star.font = .boldSystemFont(ofSize: 32.0)
            star.textColor = componentInactiveColor
            star.tag = i
            addSubview(star)
            starArray.append(star)
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
}
