//
//  CustomControl.swift
//  StarRating
//
//  Created by Kenneth Jones on 5/29/20.
//  Copyright © 2020 Kenneth Jones. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value = 1
    var labelArray: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    private func setup() {
        
        for tag in 1...componentCount {
            let label = UILabel()
            label.tag = tag
            label.frame = CGRect(origin: CGPoint(x: Int(componentDimension) * (tag - 1) + 16, y: 0), size: CGSize(width: componentDimension, height: componentDimension))
            label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
            label.text = "✩"
            label.textAlignment = .center
            if tag == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            labelArray.append(label)
            addSubview(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    private func updateValue(at touch: UITouch) {
        for label in labelArray {
            let touchPoint = touch.location(in: label)
            if label.bounds.contains(touchPoint) {
                if value != label.tag {
                    value = label.tag
                    label.performFlare()
                    sendActions(for: .valueChanged)
                }
            }
        }
        
        for tag in 0..<value {
            labelArray[tag].textColor = componentActiveColor
        }
        
        for tag in value..<labelArray.count {
            labelArray[tag].textColor = componentInactiveColor
        }
    }

    // MARK: - Touch Tracking
        
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [.touchDown])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside])
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
            updateValue(at: touch)
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
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
