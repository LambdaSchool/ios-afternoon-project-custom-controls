//
//  CustomControl.swift
//  StarCustomControl
//
//  Created by Lambda_School_Loaner_204 on 11/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    var value = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        var labels: [UILabel] = []
        
        for n in 1...componentCount {
            let label = UILabel()
            label.tag = n
            let frameX = componentDimension * CGFloat((n - 1)) + CGFloat(8 * n)
            label.frame = CGRect(x: frameX,
                                 y: 0,
                                 width: componentDimension,
                                 height: componentDimension)
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.textAlignment = .center
            label.text = "⭒"
            
            if n == 1 { label.textColor = componentActiveColor }
            else { label.textColor = componentInactiveColor }
            
            addSubview(label)
            labels.append(label)
        }
        
        
    }
}
