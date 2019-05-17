//
//  CustomControl.swift
//  Start
//
//  Created by Christopher Aronson on 5/16/19.
//  Copyright © 2019 Christopher Aronson. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    var value = 1
    
    private var labels: [UILabel] = []
    
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
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        for tagValue in 0..<componentCount {
            let label = UILabel()
            
            label.tag = tagValue + 1
            label.font = .systemFont(ofSize: 32, weight: .bold)
            label.text = "★"
            label.textAlignment = .center
            
            if label.tag == 1 {
                label.frame = CGRect(x: 8, y: 0, width: componentDimension, height: componentDimension)
                label.textColor = componentActiveColor
            } else {
                label.frame = CGRect(x: componentDimension * CGFloat(tagValue) + 8, y: 0, width: componentDimension, height: componentDimension)
                label.textColor = componentInactiveColor
            }
            
            addSubview(label)
            labels.append(label)
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        if bounds.contains(touch.location(in: self)) {
            sendActions(for: .touchDragInside)
            updateValue(at: touch)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        
        if bounds.contains(touch.location(in: self)) {
            sendActions(for: .touchUpInside)
            updateValue(at: touch)
        } else {
            sendActions(for: .touchUpOutside)
        }
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        for label in labels {
            if label.frame.contains(touch.location(in: self)) {
                if value != label.tag {
                    value = label.tag
                    updateColor()
                    sendActions(for: [.valueChanged])
                }
            }
        }
    }
    
    func updateColor() {
        for label in labels {
            if label.tag <= value {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
        }
    }



}
