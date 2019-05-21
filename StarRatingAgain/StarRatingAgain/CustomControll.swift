//
//  CustomControll.swift
//  Star Rating
//
//  Created by Ryan Murphy on 5/21/19.
//  Copyright © 2019 Ryan Murphy. All rights reserved.
//

import UIKit

class CustomController: UIControl {
    var value: Int = 1
    
    var labels: [UILabel] = []
    
    private let componentDimenstion: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.magenta
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimenstion
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimenstion)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        updateValue(at: touch)
        
        sendActions(for: [.valueChanged, .touchDown])
        
        return true
    }
    
 
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let touchPoint = touch.location(in: self)
        
        updateValue(at: touch)
        
        if bounds.contains(touchPoint){
            sendActions(for: [.valueChanged, .touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        
        defer {
            super.endTracking(touch, with: event)
        }
        
        
        guard let touchPoint = touch?.location(in: self) else { return }
        
       
        
        if bounds.contains(touchPoint){
            guard let touch = touch else { return }
            sendActions(for: [.valueChanged, .touchDragInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    

    
    func setup() {
        
        for i in 0..<componentCount {
        let starLabel = UILabel()
        starLabel.text = "✭"
        starLabel.tag = i + 1
        starLabel.textAlignment = .center
        starLabel.font = .systemFont(ofSize: 32, weight: .bold)
        
        self.addSubview(starLabel)
            
            if starLabel.tag == 1 {
                starLabel.frame = CGRect(x: 8.0, y: 0, width: componentDimenstion, height: componentDimenstion)
                starLabel.textColor = componentActiveColor
            } else {
                starLabel.frame = CGRect(x: (CGFloat(i) * componentDimenstion) + 8.0, y: 0, width: componentDimenstion, height: componentDimenstion)
                starLabel.textColor = componentInactiveColor
            }
            
            labels.append(starLabel)
        }
        
    }
    

    
    private func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        
        for starLabel in labels {
            if starLabel.frame.contains(touchPoint) {
                if value != starLabel.tag {
                    value = starLabel.tag
                    
                    for label in labels {
                        if label.tag <= value {
                            label.textColor = componentActiveColor
                        } else {
                            label.textColor = componentInactiveColor
                        }
                    }
                    
                    sendActions(for: .valueChanged)
                }
            }
        }
    }
    
    
    
    
}
