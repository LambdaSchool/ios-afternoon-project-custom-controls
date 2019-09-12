//
//  CustomControl.swift
//  Star Rating
//
//  Created by Alex Shillingford on 9/12/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    let componentActiveColor: UIColor = .black
    let componentInactiveColor: UIColor = .gray
    var starArray: [UILabel] = []
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    func setup() {
        for tagNumber in 1...componentCount {
            let starLabel = UILabel()
            starLabel.tag = tagNumber
            
            switch tagNumber {
            case 1:
                starLabel.frame = CGRect(x: 8, y: 0, width: componentDimension, height: componentDimension)
            case 2:
                starLabel.frame = CGRect(x: componentDimension + 16, y: 0, width: componentDimension, height: componentDimension)
            case 3:
                starLabel.frame = CGRect(x: componentDimension * 2 + 24, y: 0, width: componentDimension, height: componentDimension)
            case 4:
                starLabel.frame = CGRect(x: componentDimension * 3 + 32, y: 0, width: componentDimension, height: componentDimension)
            default:
                starLabel.frame = CGRect(x: componentDimension * 4 + 40, y: 0, width: componentDimension, height: componentDimension)
            }
            starLabel.font = UIFont.boldSystemFont(ofSize: 32)
            starLabel.text = "★"
            starLabel.textAlignment = .center
            
            if starLabel.tag == 1 {
                starLabel.textColor = componentActiveColor
            } else {
                starLabel.textColor = componentInactiveColor
            }
            
            addSubview(starLabel)
            starArray.append(starLabel)
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if self.bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
            // If we touched initially outside of the color wheel, we don't need to keep tracking that touch
            return false
        }
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if self.bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
            // If we touched initially outside of the color wheel, we don't need to keep tracking that touch
            return false
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        defer {
            super.endTracking(touch, with: event)
        }
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if self.bounds.contains(touchPoint) {
            sendActions(for: [.valueChanged, .touchUpInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchUpOutside])
        }
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        
        for star in starArray {
            if star.frame.contains(touchPoint) {
                value = star.tag
                
                for starLabel in starArray {
                    if starLabel.tag <= value {
                        starLabel.textColor = componentActiveColor
                    } else {
                        starLabel.textColor = componentInactiveColor
                    }
                }
            }
        }
    }
    
}
