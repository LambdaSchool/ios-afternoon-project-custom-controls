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
            starLabel.frame = CGRect(x: (componentDimensions * CGFloat(number - 1)) + CGFloat(8 * number), y: 0, width: componentDimensions, height: componentDimensions)

            if number == 1 {

                starLabel.text = "★"
                addSubview(starLabel)
                starLabels.append(starLabel)

            } else {
                starLabel.text = "☆"
                addSubview(starLabel)
                starLabels.append(starLabel)
                
            }
        }

    }
    
} //End of class
