//
//  CustomControl.swift
//  Ratings
//
//  Created by Niranjan Kumar on 11/7/19.
//  Copyright © 2019 Nar Kumar. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: CGFloat = 5.0
    private let componentActiveColor: UIColor = .black
    private let componentInativeColor: UIColor = .gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        
        
        
    }
    
}
