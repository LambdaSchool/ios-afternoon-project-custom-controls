//
//  CustomControl.swift
//  Star Rating
//
//  Created by Sal Amer on 2/6/20.
//  Copyright © 2020 Sal Amer. All rights reserved.
//

import UIKit

@IBDesignable
class CustomControl: UIControl {

    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    private var startLabels: [UILabel] = []
    
    //MARK: -- Initializers
   //initialize from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    //from story board
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
 
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
    
    func setup() {
        for stars in 1...componentCount {
            let label = UILabel()
            label.tag = stars
            label.viewWithTag(1)?.frame = CGRect(x: 8.0, y: 0, width: componentDimension, height: componentDimension)
            label.viewWithTag(2)?.frame = CGRect(x: componentDimension + 16, y: 0, width: componentDimension, height: componentDimension)
            label.viewWithTag(3)?.frame = CGRect(x: componentDimension * 2 + 24, y: 0, width: componentDimension, height: componentDimension)
            label.viewWithTag(4)?.frame = CGRect(x: componentDimension * 3 + 32, y: 0, width: componentDimension, height: componentDimension)
            label.viewWithTag(5)?.frame = CGRect(x: componentDimension * 4 + 40, y: 0, width: componentDimension, height: componentDimension)
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.text = "☆"
            label.textAlignment = .center
            if value == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            addSubview(label)
            startLabels.append(label)
        }
        
        
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
 

}
