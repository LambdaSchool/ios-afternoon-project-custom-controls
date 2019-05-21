//
//  CustomControl.swift
//  Custom Controls
//
//  Created by Mitchell Budge on 5/21/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    var labelArray: [UILabel] = []
    
    func setup() {
        for labelIndex in 1...componentCount {
            let label = UILabel()
            label.tag = labelIndex
            label.frame = CGRect(x: 8 + componentDimension * CGFloat(labelIndex), y: 0, width: componentDimension, height: componentDimension)
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "☆"
            label.textAlignment = .center
            label.textColor = componentInactiveColor
            addSubview(label)
            labelArray.append(label)
        }
    }
  
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    func updateValue(at touch: UITouch) {
        for star in labelArray {
            if star.frame.contains(touch.location(in: self)) {
                if value != star.tag {
                    value = star.tag
                    for index in 1...componentCount {
                        if index - 1 == 0 {
                            star.textColor = componentInactiveColor
                        } else if index > 0 {
                            star.textColor = componentActiveColor
                        }
                    sendActions(for: [.valueChanged])
                    }
                }
            }
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [.touchDown])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchpoint = touch.location(in: self)
        if bounds.contains(touchpoint) {
            sendActions(for: [.touchDragInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchpoint = touch.location(in: self)
        if bounds.contains(touchpoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside, .valueChanged])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel, .valueChanged])
    }
}
