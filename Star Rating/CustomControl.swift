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
        var xPosition: CGFloat = 10.00
        
        for index in 1...5 {
            
            
            let label = UILabel(frame: CGRect(x: xPosition, y: 0, width: 50, height: 50))
            xPosition += 10.0
            label.text = "A"
            
            
            
            labelArray.append(label)
            addSubview(label)

        }
    }
}
