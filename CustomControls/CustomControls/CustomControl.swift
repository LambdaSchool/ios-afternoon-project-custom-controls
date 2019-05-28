//
//  CustomControl.swift
//  CustomControls
//
//  Created by Thomas Cacciatore on 5/28/19.
//  Copyright © 2019 Thomas Cacciatore. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    let componentActiveColor: UIColor = .black
    let componentInactiveColor: UIColor = .gray
    
    
    func setup() {
        var labels: [UILabel] = []
        let spacing: CGFloat = 8
        var xPosition: CGFloat = spacing
        let yPosition: CGFloat = 0
        for i in 0...componentCount - 1 {
            let label = UILabel()
            label.backgroundColor = .orange
            addSubview(label)
            label.tag = i + 1
            labels.append(label)
            let frameSize = CGSize(width: componentDimension, height: componentDimension)
            label.frame.size = frameSize
            label.frame.origin = CGPoint(x: xPosition, y: yPosition)
            xPosition += componentDimension + spacing
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "☆"
            label.textAlignment = .center
            if label.tag == 1 {
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
    func updateValue(at touch: UITouch) {
        // What changes based on user's touch
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        //Update values
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            //update values based on label touched
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            //update values based on the label touched
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
        }

}
