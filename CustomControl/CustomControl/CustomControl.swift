//
//  CustomControl.swift
//  CustomControl
//
//  Created by Jessie Ann Griffin on 9/26/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit
/*
 Create a new Swift file using File > New File. Name it CustomControl.swift.
In the file, import UIKit and create a new type (called CustomControl) that you subclass from UIControl.
*/
class CustomControl: UIControl {

    var value: Int = 1
    var stars: [UILabel] = []
 
    private let componentDimension: CGFloat = 40.0
    private let componentCount: UInt = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    private let componentDistance: CGFloat = 8.0
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        for i in 0..<componentCount {
            let label = UILabel()
            addSubview(label)
            
            label.tag = Int(i + 1)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "✭"
            label.textAlignment = .center
            
            if i == 0 {
                label.frame = CGRect(x: componentDistance,
                y: 0.0,
                width: componentDimension,
                height: componentDimension)

            } else {
                label.frame = CGRect(x: componentDimension + componentDistance * CGFloat(i),
                y: 0.0,
                width: componentDimension,
                height: componentDimension)
            }

            if i == 0 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
            label.font = .boldSystemFont(ofSize: 32.0)
            stars.append(label)

        }
        
//        for label in stars {
//            if label == stars[0] {
//                label.frame = CGRect(x: componentDistance,
//                y: 0.0,
//                width: componentDimension,
//                height: componentDimension)
//
//            } else {
//                label.frame = CGRect(x: componentDimension + componentDistance * 2,
//                y: 0.0,
//                width: componentDimension,
//                height: componentDimension)
//            }
//
//            if label == stars[0] {
//                label.textColor = componentActiveColor
//            } else {
//                label.textColor = componentInactiveColor
//            }
//        }
    }
    
    override func draw(_ rect: CGRect) {
        <#code#>
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
}
