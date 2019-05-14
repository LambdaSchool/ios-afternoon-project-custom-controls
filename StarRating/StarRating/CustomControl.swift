//
//  CustomControl.swift
//  StarRating
//
//  Created by Sameera Roussi on 5/14/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

import UIKit


class CustomControl: UIControl {
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    // MARK: Properties
    
    var value: Int = 1
    
    
    // MARK: Private Constants
    
    let componentDimension: CGFloat = 40.0
    
    let componentCount = 5
    
    let componentActiveColor: UIColor = .black
    
    let componentInactiveColor: UIColor = .gray
    
    
    // MARK: Functions
    
    func setup() {
        
    }
}
