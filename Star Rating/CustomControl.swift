//
//  CustomControl.swift
//  Star Rating
//
//  Created by Andrew Ruiz on 9/12/19.
//  Copyright © 2019 Andrew Ruiz. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value : Int = 1
    
    private var componentDimension: CGFloat = 40.0
    private var componentCount = 5
    private var componentActiveColor = UIColor.black
    private var componentInactiveColor = UIColor.gray
    
    // Storyboard initializer
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setUp()
    }
    
    func setUp() {
        
        var labelArray : [UILabel] = []
        var xPosition: CGFloat = -100 // TODO: Change to 8.0 Not sure why not working.
        
        for index in 1...5 {
            
            let label = UILabel(frame: CGRect(x: xPosition, y: 0, width: componentDimension, height: componentDimension))
         
            xPosition += 8.0 + componentDimension
            
            label.text = "☆"
            label.tag = index
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.textAlignment = .center
            
            if index == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
            labelArray.append(label)
            addSubview(label)

        }
    }
}
