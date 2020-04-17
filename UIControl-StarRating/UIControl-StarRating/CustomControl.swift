//
//  CustomControl.swift
//  UIControl-StarRating
//
//  Created by David Williams on 4/16/20.
//  Copyright © 2020 david williams. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    var labels: [UILabel] = []
    var inBounds: Bool = false
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: CGFloat = 5.0
    private let componentActiveColor: UIColor = .systemTeal
    private let componentInactiveColor: UIColor = .systemGreen
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setUp()
        ()
    }
    
    func setUp() {
        
        for index in 1...6 {
            
            let label = UILabel()
            addSubview(label)
            labels.append(label)
            label.tag = index
            label.frame = CGRect(x: componentDimension + CGFloat((index * 28)), y: 0.0, width: componentDimension, height: componentDimension)
            label.text = "✭"
            label.font = UIFont(name: "systemBold", size: 32.0)
            label.textAlignment = .center
            
            if inBounds {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 28.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
}

extension CustomControl {
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        updateValue(at: touch)
        
        sendActions(for: [.touchDown])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        defer {
            super.endTracking(touch, with: event)
        }
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
        } else if !bounds.contains(touchPoint ){
            
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        for label in labels {
            label.textColor = componentInactiveColor
            if label.frame.contains(touchPoint) {
                value = label.tag
                label.performFlare()
                for label in labels where label.tag <= value {
                label.textColor = componentActiveColor
                sendActions(for: .valueChanged)
                }
            }
        }
    }
}


extension UIView {
  // "Flare view" animation sequence
  func performFlare() {
    func flare()   { transform = CGAffineTransform(scaleX: 8.6, y: 8.6) }
    func unflare() { transform = .identity }
    
    UIView.animate(withDuration: 0.3,
                   animations: { flare() },
                   completion: { _ in UIView.animate(withDuration: 0.19) { unflare() }})
  }
}
