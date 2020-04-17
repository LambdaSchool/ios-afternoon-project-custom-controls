//
//  CustomControl.swift
//  UIControl-StarRating
//
//  Created by David Williams on 4/16/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    var labels: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: CGFloat = 5.0
    private let componentActiveColor: UIColor = .black
    private let componentInActiveColor: UIColor = .gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setUp()
        ()
    }
    
    func setUp() {
        
        for index in 1...5 {
            
            let label = UILabel()
            addSubview(label)
            labels.append(label)
            label.tag = index
            label.frame = CGRect(x: componentDimension + CGFloat((index * 18)), y: 0.0, width: componentDimension, height: componentDimension)
            label.text = "☆"
            label.font = UIFont(name: "systemBold", size: 32.0)
            label.textAlignment = .center
            label.textColor = componentInActiveColor
            
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
}

extension CustomControl {
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
       // updateValue()
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
          //  updateValue()
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        defer {
            super.endTracking(touch, with: event)
        }
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
}
