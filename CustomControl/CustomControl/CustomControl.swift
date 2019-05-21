//
//  CustomControl.swift
//  CustomControl
//
//  Created by Jeremy Taylor on 5/21/19.
//  Copyright © 2019 Bytes-Random L.L.C. All rights reserved.
//

import UIKit

@IBDesignable class CustomControl: UIControl {
    var value = 1
    var oldValue = 0
    
    var starLabels: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 6
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        for index in 1...componentCount {
            let x = CGFloat(index - 1)*(componentDimension + 8.0)
            let label = UILabel(frame: CGRect(x: x, y: 0.0, width: componentDimension, height: componentDimension))
            label.tag = index
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "✮"
            label.textAlignment = .center
            
            label.textColor = index == 1 ? componentActiveColor : componentInactiveColor
            
            addSubview(label)
            starLabels.append(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: .touchDragInside)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: .touchUpInside)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        
        for label in starLabels {
            
            if label.frame.contains(touchPoint) {
                value = label.tag
                
                for index in 1...starLabels.count {
                    switch index <= value {
                    case true:
                        starLabels[index - 1].textColor = componentActiveColor
                    case false:
                        starLabels[index - 1].textColor = componentInactiveColor
                    }
                }
                if value != oldValue {
                    label.textColor = componentActiveColor
                    performFlare()
                    sendActions(for: .valueChanged)
                }
                oldValue = value
            }
        }
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
