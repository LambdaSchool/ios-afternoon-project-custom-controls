//
//  CustomControl.swift
//  CustomControlsAP
//
//  Created by Jorge Alvarez on 1/23/20.
//  Copyright © 2020 Jorge Alvarez. All rights reserved.
//

import Foundation
import UIKit



class CustomControl: UIControl {
    
    // MARK: - Properties
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.lightGray
    
    var value: Int = 1
    var labelArray: [UILabel] = []
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        for i in 1...5 {
            let label = UILabel()
            addSubview(label)
            labelArray.append(label)
            label.tag = i
            label.frame = CGRect(x: (componentDimension * CGFloat(i - 1)) + CGFloat(8 * i), y: 0, width: componentDimension, height: componentDimension)
            if i == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            label.text = "☆"
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 32) // Change later?
            //label.font = UIFont(name: "System-Bold", size: 32)
            //label.font = UIFont.systemFont(ofSize: 32, weight: UIFont.Weight.bold)
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
}
