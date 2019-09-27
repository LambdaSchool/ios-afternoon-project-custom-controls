//
//  CustomControl.swift
//  StarRating
//
//  Created by John Kouris on 9/26/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    static var value: Int = 1
    private let componenetDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    func setup() {
        var labelArray = [UILabel]()
        
        for i in 1...5 {
            let label = UILabel()
            label.tag = i
            addSubview(label)
            labelArray.append(label)
        }
        
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
