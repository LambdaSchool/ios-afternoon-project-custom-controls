//
//  CustomControl.swift
//  StarRating
//
//  Created by Chad Parker on 4/16/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    private var labels: [UILabel] = []
    
    private let componentDimension: CGFloat = 40
    private let componentCount = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        for i in 1...5 {
            let label = UILabel()
            label.tag = i
            label.font = .boldSystemFont(ofSize: 32)
            label.text = "⭑"
            label.textAlignment = .center
            label.textColor = (i <= value) ? componentActiveColor : componentInactiveColor
            label.frame = CGRect(x: 8 + CGFloat(i-1) * (componentDimension + 8), y: 0, width: componentDimension, height: componentDimension)
            
            addSubview(label)
            labels.append(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension + 5)
    }
    
    func updateValue(at touch: UITouch) {
        labels.forEach {
            if $0.frame.contains(touch.location(in: self)) {
                if value != $0.tag {
                    value = $0.tag
                    sendActions(for: .valueChanged)
                    $0.performFlare()
                    
                    labels.forEach {
                        $0.textColor = ($0.tag <= value) ? componentActiveColor : componentInactiveColor
                    }
                }
            }
        }
    }
    
    // MARK: - UIControl
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if bounds.contains(touch.location(in: self)) {
            updateValue(at: touch)
            sendActions(for: .touchDragInside)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        guard let touch = touch else { return }
        if bounds.contains(touch.location(in: self)) {
            updateValue(at: touch)
            sendActions(for: .touchUpInside)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        super.cancelTracking(with: event)
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
