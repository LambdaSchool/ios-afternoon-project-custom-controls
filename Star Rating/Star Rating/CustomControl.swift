//
//  CustomControl.swift
//  Star Rating
//
//  Created by Vici Shaweddy on 9/26/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    private let componentDimension: CGFloat = 40.0
    private let componentCount: CGFloat = 6.0
    private let componentActiveColor: CGFloat = 1
    private let componentInactiveColor: CGFloat = 0.5
    private var labels: [UILabel] = []
    private var leftRight = true
    
    var value: Int = 1 {
        didSet {
            if value != oldValue {
                sendActions(for: .valueChanged)
            }
        }
    }
    
    required init?(coder aCoder:NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    func setup() {
        for i in 1...Int(componentCount) {
            let label = UILabel()
            label.text = "⭐️"
            label.tag = i
            self.addSubview(label)
            self.labels.append(label)
            
            let x = CGFloat(i) * 8.0 + (CGFloat(i - 1) * componentDimension)
            label.frame = CGRect(x: x, y: 0, width: componentDimension, height: componentDimension)
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.textAlignment = .center
        }
        updateColor()
    }
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        
        for label in self.labels {
            if label.frame.contains(touchPoint) {
                self.value = label.tag
                updateColor()
                label.performFlare()
            }
        }
    }
    
    func updateColor() {
        for label in self.labels {
            if label.tag <= self.value {
                label.alpha = self.componentActiveColor
            } else {
                label.alpha = self.componentInactiveColor
            }
        }
    }
    
    // MARK: - Touch Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: .touchDragInside)
            updateValue(at: touch)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
        
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: .touchUpInside)
            updateValue(at: touch)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
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
