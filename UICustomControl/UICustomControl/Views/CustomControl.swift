//
//  CustomControl.swift
//  UICustomControl
//
//  Created by Breena Greek on 4/16/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    var value: Int = 1
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    var labels: [UILabel] = []
    
    // Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    func setup() {
        for i in 0...4 {
            let tempLabel = UILabel()
            tempLabel.tag = i + 1
            tempLabel.frame.size = CGSize(width: componentDimension, height: componentDimension)
            tempLabel.font = .systemFont(ofSize: 32.0, weight: .bold)
            tempLabel.text = "⭑"
            tempLabel.translatesAutoresizingMaskIntoConstraints = false
            tempLabel.performFlare()
            addSubview(tempLabel)
            
            if i - 1 <= value {
                tempLabel.textColor = .black
            } else {
                tempLabel.textColor = .gray
            }
            
            if i != 0 {
                NSLayoutConstraint.activate([
                    NSLayoutConstraint(item: tempLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: tempLabel, attribute: .leading, relatedBy: .equal, toItem: labels[i - 1], attribute: .leading, multiplier: 1.0, constant: componentDimension + 8.0)])
            } else {
                NSLayoutConstraint.activate([
                    NSLayoutConstraint(item: tempLabel, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: tempLabel, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 8.0)])
            }
            
            labels.append(tempLabel)
        }
    }
}

// UIControl Touch Tracking
extension CustomControl {
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch
        updateValue(at: touchPoint)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touch = touch
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .touchDragOutside])
            updateValue(at: touch)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer {
            super.endTracking(touch, with: event)
        }
        
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: .touchUpInside)
            updateValue(at: touch)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        for i in labels {
            if i.bounds.contains(touch.location(in: self)) {
                value = i.tag
                sendActions(for: .valueChanged)
            }
        }
        
        for i in labels {
            if i.tag < value {
                i.textColor = .black
            } else {
                i.textColor = .gray
            }
        }
    }
}
extension UIView {
  func performFlare() {
    func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
    func unflare() { transform = .identity }
    
    UIView.animate(withDuration: 0.3,
                   animations: { flare() },
                   completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
  }
}
