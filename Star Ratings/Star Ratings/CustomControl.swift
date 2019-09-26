//
//  CustomControl.swift
//  Star Ratings
//
//  Created by Dillon P on 9/25/19.
//  Copyright © 2019 Lambda iOSPT2. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1 // default value of 1 is API facing i.e. customers can see
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: Int = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    // init for programmatic layouts
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    // init for storyboard layouts
    required init?(coder: NSCoder) { ///if this is done a storyboard, needs to run NSCoder in order to run
        super.init(coder: coder)
        setUpSubviews()
    }
    
    func setUpSubviews() {
        
        
        
    }
    
    
}
