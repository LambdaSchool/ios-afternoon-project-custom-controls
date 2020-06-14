//
//  CustomControl.swift
//  CustomControls
//
//  Created by Josh Kocsis on 5/28/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    var labelArray: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        
        for number in 1...componentCount {
            let label = UILabel()
            label.tag = number
            if number == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
            label.frame.size = CGSize(width: componentDimension, height: componentDimension)
            
            let x = CGFloat(number - 1) * componentDimension + CGFloat(number * 16)
            
            labelArray.append(label)
            addSubview(label)
            label.center = CGPoint(x: x, y: 0)
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.text = "☆"
            label.textColor = componentInactiveColor
            

        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    func updateValue(at touch: UITouch) {
        for star in labelArray{
            if star.frame.contains(touch.location(in: self)) {
                value = star.tag
                    star.textColor = componentActiveColor
                sendActions(for: .valueChanged)
            } else if star.tag < value {
                star.textColor = componentInactiveColor
                sendActions(for: .valueChanged)
                    }
                }
            }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: .touchDragOutside)
            return false
        }
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: .touchDragOutside)
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
}

