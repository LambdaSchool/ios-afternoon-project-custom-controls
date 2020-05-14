//
//  CustomControl.swift
//  StarRating
//
//  Created by Nonye on 5/14/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit

@IBDesignable
class CustomControl: UIControl {

    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    required init?(coder acoder: NSCoder) {
        super.init(coder: acoder)
        setup()
    }
    
    func setup() {
        var labelOne = UILabel()
        var labelTwo = UILabel()
        var labelThree = UILabel()
        var labelFour = UILabel()
        var labelFive = UILabel()
        
        let labelArray = [labelOne, labelTwo, labelThree, labelFour, labelFive]
        
       
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    

}
