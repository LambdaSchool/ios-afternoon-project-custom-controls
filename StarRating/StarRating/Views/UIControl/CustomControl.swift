//
//  CustomControl.swift
//  StarRating
//
//  Created by Aaron Cleveland on 1/28/20.
//  Copyright © 2020 Aaron Cleveland. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentSpacing: CGFloat = 8.0
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    var labels: [UILabel] = []
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    private func setup() {
        for n in 1...componentCount {
            let label = UILabel()
            label.tag = n
            
            var position = CGPoint(x: (n-1)*Int(componentDimension) + Int(componentSpacing * 2), y: 0)
            
            if n == 1 {
                position = CGPoint(x: componentSpacing, y: 0)
            }
            
            label.frame = CGRect(origin: position, size: CGSize(width: componentDimension, height: componentDimension))
            label.text = "☆"
            label.textAlignment = .center

            if n == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            addSubview(label)
            labels.append(label)
        }
    }
    
    func updateValue(at touch: UITouch) {
        for label in labels {
           if label.bounds.contains(touch.location(in: label)) {
               if label.tag != value {
                   value = label.tag
                   sendActions(for: .valueChanged)
               }
           }
        }
        for i in 0..<value {
           labels[i].textColor = componentActiveColor
        }
        for i in value..<labels.count {
           labels[i].textColor = componentInactiveColor
        }
    }
    
    func checkForTouches(for touch: UITouch?) -> Bool {
           guard let touchPoint = touch?.location(in: self) else {return false}
           if bounds.contains(touchPoint) {
               return true
           }
           return false
       }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [.touchDown])
        return true
    }

    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {

        if checkForTouches(for: touch) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        if checkForTouches(for: touch) {
            updateValue(at: touch!)
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }

    }

    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
}
