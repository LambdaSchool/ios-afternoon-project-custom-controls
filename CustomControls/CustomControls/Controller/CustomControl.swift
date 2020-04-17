//
//  CustomControl.swift
//  CustomControls
//
//  Created by Claudia Contreras on 4/16/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    var labels: [UILabel] = []
    
    // Private Constants
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        setup()
    }
    
    
    
    func setup() {
        // Add 5 labels
        for i in 1...5 {
            //Create the label
            let label = UILabel()
            
            //Add it to the array
            labels.append(label)
            
            // Add it to the subview
            addSubview(label)
            
            // Set up it's own tag to differentiate
            label.tag = i
            
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "☆"
            label.textAlignment = .center
            //Set the color of the star
            if i == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
            //Set the size and location of the labels
            let padding = CGFloat(8.0 * CGFloat(i))
            label.frame = CGRect(x: padding + (componentDimension * CGFloat(i - 1)), y: 0, width: componentDimension, height: componentDimension)
            
            print(label.frame.origin)
            
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
