//
//  CustomControl.swift
//  StarRating
//
//  Created by John Kouris on 9/26/19.
//  Copyright © 2019 John Kouris. All rights reserved.
//

import UIKit

@IBDesignable
class CustomControl: UIControl {
    
    static var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    var labelArray = [UILabel]()
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    func setup() {
        for i in 1...5 {
            let label = UILabel()
            label.tag = i
            addSubview(label)
            label.frame.size = CGSize(width: componentDimension, height: componentDimension)
            let x = CGFloat(i) * componentDimension + CGFloat(i * 8)
            label.center = CGPoint(x: x, y: 0)
            label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
            label.text = "⭑"
            label.textAlignment = .center
            if i == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
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
        for label in labelArray {
            if label.frame.contains(touch.location(in: self)) {
                CustomControl.value = label.tag
                label.textColor = componentActiveColor
                sendActions(for: [.valueChanged])
            }
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside])
            updateValue(at: touch)
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
            sendActions(for: [.touchUpInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }

    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
}
