//
//  CustomControl.swift
//  RatingCustomControl
//
//  Created by Nick Nguyen on 2/20/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import UIKit

class CustomControl: UIControl {

    var value : Int  = 1
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    private let componentDimension : CGFloat = 40.0
    
    private let componentCount  = 5
    
    private let componentActiveColor : UIColor = .black
    
    private let componentInActiveColor : UIColor = .gray
    
    var labels : [UILabel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        for i in 1 ... 5 {
            let label = UILabel()
          
            label.tag = i
            label.frame.size  = CGSize(width: componentDimension, height: componentDimension)
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.text = "⭐️"
            label.textAlignment = .center
            label.textColor = label.tag == 1 ? componentActiveColor : componentInActiveColor
            switch label.tag {
            case 1:
                label.frame.origin = CGPoint(x: 8.0, y: 0)
            case 2:
                label.frame.origin = CGPoint(x: componentDimension + 16.0, y: 0)
            case 3:
                label.frame.origin = CGPoint(x: componentDimension + 64.0, y: 0)
            case 4:
                label.frame.origin = CGPoint(x: componentDimension + 112.0, y: 0)
            case 5:
                label.frame.origin = CGPoint(x: componentDimension + 160.0, y: 0)
            default:
                break
            }
            addSubview(label)
            labels.append(label)
            
        }
        
    }
    
   

}
