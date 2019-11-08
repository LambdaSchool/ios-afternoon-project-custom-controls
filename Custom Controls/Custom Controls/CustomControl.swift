//
//  CustomControl.swift
//  Custom Controls
//
//  Created by Dennis Rudolph on 11/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomControl: UIControl {
    
    var value: Int = 1 {
        didSet {
            switch self.value {
            case 1:
                labelArray[0].textColor = componentActiveColor
                labelArray[1].textColor = componentInactiveColor
                labelArray[2].textColor = componentInactiveColor
                labelArray[3].textColor = componentInactiveColor
                labelArray[4].textColor = componentInactiveColor
            case 2:
                labelArray[0].textColor = componentActiveColor
                labelArray[1].textColor = componentActiveColor
                labelArray[2].textColor = componentInactiveColor
                labelArray[3].textColor = componentInactiveColor
                labelArray[4].textColor = componentInactiveColor
            case 3:
                labelArray[0].textColor = componentActiveColor
                labelArray[1].textColor = componentActiveColor
                labelArray[2].textColor = componentActiveColor
                labelArray[3].textColor = componentInactiveColor
                labelArray[4].textColor = componentInactiveColor
            case 4:
                labelArray[0].textColor = componentActiveColor
                labelArray[1].textColor = componentActiveColor
                labelArray[2].textColor = componentActiveColor
                labelArray[3].textColor = componentActiveColor
                labelArray[4].textColor = componentInactiveColor
            default:
                labelArray[0].textColor = componentActiveColor
                labelArray[1].textColor = componentActiveColor
                labelArray[2].textColor = componentActiveColor
                labelArray[3].textColor = componentActiveColor
                labelArray[4].textColor = componentActiveColor
            }
        }
    }
    
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.lightGray
    var labelArray: [UILabel] = []
    // MARK: - Setup
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp() {
        
        var iteration = 0
        
        //make labels
        for count in 1...componentCount {
            let labelInstance = UILabel()
            addSubview(labelInstance)
            labelInstance.tag = count
            labelArray.append(labelInstance)
        }
        
        //construct labels
        for label in labelArray {
            iteration += 1
            label.frame.size = CGSize(width: componentDimension, height: componentDimension)
            let floatCount = CGFloat(integerLiteral: iteration)
            label.frame.origin = CGPoint(x: (componentDimension * (floatCount - 1.0)) + (8.0 * floatCount), y: 0)
            label.font = .boldSystemFont(ofSize: 32.0)
            label.text = "✰"
            label.textAlignment = .center
            if iteration == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    // MARK: - Touch Tracking
    
    func updateValue(at touch: UITouch) {
        
        let touchPoint = touch.location(in: self)
        
        for label in labelArray {
            
            let xy = label.frame.origin
            
            for x in stride(from: xy.x.rounded(), to: xy.x.rounded() + componentDimension, by: 1.0)  {
                for y in stride(from: xy.y.rounded(), to: xy.y.rounded() + componentDimension, by: 1.0) {
                    if touchPoint.x.rounded() == x && touchPoint.y.rounded() == y {
                        value = label.tag
                        label.performFlare()
                    }
                }
            }
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
}

extension UIView {
    // "Flare view" animation sequence
    func performFlare() {
        func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
        func unflare() { transform = .identity }
        
        UIView.animate(withDuration: 0.3,
                       animations: { flare() },
                       completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
    }
}
