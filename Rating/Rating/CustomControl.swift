//
//  CustomControl.swift
//  Rating
//
//  Created by Dahna on 4/16/20.
//  Copyright © 2020 Dahna Buenrostro. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: Int = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        
    }
    
    func setup() {
        
        var labelArray = [UILabel]()
        
        
        
    }
}
