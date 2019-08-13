//
//  CustomControl.swift
//  Star Rating
//
//  Created by Nathan Hedgeman on 8/13/19.
//  Copyright © 2019 Nate Hedgeman. All rights reserved.
//

import Foundation
import UIKit

class CustomControl : UIControl {
    
    //Properties
    var value: Int = 1
    var starArray: [UILabel] = []
    var stackView = UIStackView()
    
    let componentDimension: CGFloat = 40
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
            
        }
}

//MARK: - Funtions
extension CustomControl {
    
    
    func setup() {
        
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 25
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor )
        stackView.backgroundColor = .red
        stackView.isUserInteractionEnabled = false
        self.addSubview(stackView)
        
        for _ in 1...componentCount {
            
            let star = UILabel()
            
            star.tag = starArray.count + 1
            
            star.frame.size = CGSize(width: componentDimension, height: componentDimension)
            
            star.text = "★"
            
            star.font = .boldSystemFont(ofSize: 35)
            
            star.textAlignment = .center
            
            stackView.addArrangedSubview(star)
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            //Set Star Color
            switch star.tag {
            case 1:
                star.textColor = componentActiveColor
            case 2:
                star.textColor = componentInactiveColor
            case 3:
                star.textColor = componentInactiveColor
            case 4:
                star.textColor = componentInactiveColor
            case 5:
                star.textColor = componentInactiveColor
            default:
                star.textColor = componentInactiveColor
            }
            
            starArray.append(star)
            
        }
        
    }
    
}
