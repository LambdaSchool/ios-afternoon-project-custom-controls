//
//  CustomControl.swift
//  Star Rating
//
//  Created by Nichole Davidson on 3/19/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

// This property is API-facing, clients will be able to see it.
// Establishes your control as a value-providing (and value-changing) type.
class CustomControl: UIControl {
    
    // MARK: - Properties
    
    var starArray: [UILabel] = []
    var value: Int = 1
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
    
    // MARK: - Initializers

    func setup() {
        frame = CGRect(origin: .zero, size: intrinsicContentSize)
        for i in 1...componentCount{
            let star = UILabel()
            addSubview(star)
            starArray.append(star)
            star.tag = i
            let offset = CGFloat(i - 1) * componentDimension + CGFloat(i) * 8.0
            let starSize = CGSize(width: componentDimension, height: componentDimension)
            let starOrigin = CGPoint(x: offset, y: 0)
            star.frame = CGRect(origin: starOrigin, size: starSize)
            star.textAlignment = .center
            star.text = "✯"
            star.font = .boldSystemFont(ofSize: 32.0)
            if i == 1 {
                star.textColor = componentActiveColor
            } else {
            star.textColor = componentInactiveColor
            }
        }
    }
    
    required init?(coder aCoder: NSCoder) {
           super.init(coder: aCoder)
           setup()
           
       }
    
    // MARK: - Touch Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if self.bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if self.bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(at touch: UITouch) {
         let oldValue = value
        let touchPoint = touch.location(in: self)
        for star in starArray {
            if star.frame.contains(touchPoint) && star.tag != value {
                value = star.tag
                
            }
            
            for i in 1...componentCount {
                switch i <= value {
                case true:
                    starArray[i - 1].textColor = componentActiveColor
                case false:
                    starArray[i - 1].textColor = componentInactiveColor
                }
            }
        }
       
        if value != oldValue {
            sendActions(for: .valueChanged)
        }
    }
      
}
