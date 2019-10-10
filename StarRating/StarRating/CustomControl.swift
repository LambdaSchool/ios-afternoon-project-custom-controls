//
//  CustomControl.swift
//  StarRating
//
//  Created by admin on 10/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    private var componentDimension: CGFloat = 40.0
    private var componentCount = 5
    private var componentActiveColor: UIColor = .black
    private var componentInactiveColor: UIColor = .gray
    private var labels: [UILabel] = []
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setUp()
    }
    
    func setUp() {
        
        var seperationWidth: CGFloat = 8
        
        for index in 1...componentCount {
            
            let label = UILabel()
            
            tag = index
            
            label.frame = CGRect(x: seperationWidth, y: 0, width: componentDimension, height: componentDimension)
            let newSeperator = 8 + componentDimension
            seperationWidth += newSeperator
            
            
            if index == 1 {
                
                label.textColor = componentActiveColor
                
            } else {
                
                label.textColor = componentInactiveColor
                
            }
            
            
            // layout
            
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.text = "★"
            label.textAlignment = .center
            addSubview(label)
            labels.append(label)
        }
        
    }
    
    
    
}


