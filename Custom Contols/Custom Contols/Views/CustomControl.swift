//
//  CustomControl.swift
//  Custom Contols
//
//  Created by Waseem Idelbi on 4/16/20.
//  Copyright © 2020 WaseemID. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    //MARK: -Properties-
    
    var value: Int = 1
    let componentDimensions: CGFloat = 40.0
    let componentCount: Int = 5
    let componentActiveColor: UIColor = .black
    let componentInactiveColor: UIColor = .gray
    var starLabels: [UILabel] = []
    
    //MARK: -Methods-
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        
        for number in 1...5 {
            
            let starLabel = UILabel()
            starLabel.tag = number
            
            if number == 1 {
                
                starLabel.text = "★"
                starLabel.frame = CGRect(x: 8, y: 0, width: componentDimensions, height: componentDimensions)
                addSubview(starLabel)
                starLabels.append(starLabel)
                
            } else {
                starLabel.text = "☆"
                starLabel.frame = CGRect(x: CGFloat(CGFloat(number * 8) + componentDimensions), y: 0, width: componentDimensions, height: componentDimensions)
                addSubview(starLabel)
                starLabels.append(starLabel)            }
        }
        
    }
    
} //End of class
