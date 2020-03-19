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
            
            spacer += componentSpace
            newStar.frame = CGRect(origin: CGPoint(x: spacer, y: 0),
                                   size: CGSize(width: componentDimension, height: componentDimension))
            spacer += componentSpace

            addSubview(newStar)
            stars.append(newStar)
        }
    }
}
