//
//  CustomControl.swift
//  Custom Controls
//
//  Created by Isaac Lyons on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    //MARK: Init
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        setup()
    }
    
    //MARK: Properties
    
    var value: Int = 1
    var labels: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    //MARK: Methods
    
    private func setup() {
        
        frame = CGRect(origin: .zero, size: intrinsicContentSize)

        for i in 0...4 {
            let label = UILabel()
            
            label.tag = i
            label.frame = CGRect(x: 8 * CGFloat(i + 1) + CGFloat(i) * componentDimension, y: 0, width: componentDimension, height: componentDimension)
            //print("x: \(8 * CGFloat(i + 1) + CGFloat(i) * componentDimension), y: 0")
            
            //label.layer.borderWidth = 2
            //label.layer.cornerRadius = 12
            
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.textColor = (i == 0 ? componentActiveColor : componentInactiveColor)
            label.textAlignment = .center
            label.text = "✧"
            
            addSubview(label)
            
            labels.append(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }

}
