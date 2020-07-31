//
//  CustomControl.swift
//  CustomControls
//
//  Created by Cora Jacobson on 7/30/20.
//  Copyright © 2020 Cora Jacobson. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
//    Create the following private constants for your class: componentDimension, a CGFloat equal to 40.0, componentCount, equal to 5, componentActiveColor, which is UIColor.black, and componentInactiveColor, which is UIColor.gray.
    
    private let componentDimension: CGFloat = 40.0
    private var componentCount: Int = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
//    Add an init?(coder aCoder: NSCoder) initializer. After calling super, have it call a setup() function, which is where you'll perform your setup work.
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
//    In setup use a loop to create five labels (using the UILabel() constructor). Add each one as a subview. Store each label into a local array with append.
    
    var labels: [UILabel] = []
    
    private func setup() {
        for i in 1...componentCount {
            let label = UILabel()
            label.tag = i
            label.frame = CGRect(x: (8.0 * CGFloat(i)) + (CGFloat(i - 1) * componentDimension), y: 0, width: componentDimension, height: componentDimension)
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "✩"
            label.textAlignment = .center
            if i == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            labels.append(label)
            addSubview(label)
        }
    }
    
//    In your loop, add a tag for each view that represents which star it is. The first star is tag 1. The fifth is tag 5. The tags let you quickly update the control's value.
//    Set each label's frame to size componentDimension by componentDimension. (Yes, they are all square). Lay out the labels in a row with 8 points of space between each one. The first label should be at (8.0, 0), which allows a small pad between it and the edge of the control. The next one starts at (componentDimension + 16.0, 0.0), and so forth.
//    Set the font (bold system font, size 32.0), text (pick your favorite Unicode star from the character picker), and alignment (center) for your label.
//    Set the label's textColor to either the active (for the first) or inactive (for the others) component color
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
}
