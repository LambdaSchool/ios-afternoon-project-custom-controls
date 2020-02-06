//
//  CustomControl.swift
//  Star Rating
//
//  Created by David Wright on 2/5/20.
//  Copyright © 2020 David Wright. All rights reserved.
//

import UIKit

@IBDesignable
class CustomControl: UIControl {
    
    // MARK: - Properties

    var value: Int = 1
    var starLabels: [UILabel] = []
    
    // MARK: - Private Properties

    let componentDimension: CGFloat = 40.0
    let componentCount: Int = 5
    let componentActiveColor: UIColor = .black
    let componentInactiveColor: UIColor = .gray
    
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        for number in 1...componentCount {
            let label = UILabel()
            let widthOfSpacing = CGFloat(number * 8)
            let widthOfComponentsSoFar = componentDimension * CGFloat(number - 1)
            let labelOrigin = CGPoint(x: widthOfComponentsSoFar + widthOfSpacing, y: 0)
            let labelSize = CGSize(width: componentDimension, height: componentDimension)
            label.frame = CGRect(origin: labelOrigin, size: labelSize)
            label.tag = number
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "☆"
            label.textAlignment = .center
            label.textColor = (number == 1) ? componentActiveColor : componentInactiveColor
            
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
    
    private func updateValue(at touchPoint: CGPoint) {
        var value = 0
        for starLabel in starLabels {
            if touchPoint.x > starLabel.frame.minX {
                value += 1
            }
        }
        self.value = value
    }
    
    // MARK: - Touch Tracking
            
        override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
            let touchPoint = touch.location(in: self)
            updateValue(at: touchPoint)
            sendActions(for: [.touchDown, .valueChanged])
            return true
        }
        
        override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
            let touchPoint = touch.location(in: self)
            if bounds.contains(touchPoint) {
                updateValue(at: touchPoint)
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
                updateValue(at: touchPoint)
                sendActions(for: [.touchUpInside, .valueChanged])
            } else {
                sendActions(for: [.touchUpOutside])
            }
        }
        
        override func cancelTracking(with event: UIEvent?) {
            sendActions(for: [.touchCancel])
        }
    
}
