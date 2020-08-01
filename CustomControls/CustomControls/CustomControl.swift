//
//  CustomControl.swift
//  CustomControls
//
//  Created by Cora Jacobson on 7/30/20.
//  Copyright © 2020 Cora Jacobson. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private var componentCount: Int = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    var labels: [UILabel] = []
    
    private func setup() {
        for i in 1...componentCount {
            let label = UILabel()
            label.tag = i
            label.frame = CGRect(x: (8.0 * CGFloat(i)) + (CGFloat(i - 1) * componentDimension), y: 0, width: componentDimension, height: componentDimension)
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "✩"
            label.textAlignment = .center
            if i == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            labels.append(label)
            addSubview(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if bounds.contains(touch.location(in: self)) {
            sendActions(for: [.touchDragInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        if bounds.contains(touch.location(in: self)) {
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
        var newValue: Int = value
        for label in labels {
            if label.frame.contains(touch.location(in: self)) {
                label.textColor = componentActiveColor
                label.performFlare()
                newValue = label.tag
            } else if label.tag < newValue {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
        }
        value = newValue
        sendActions(for: .valueChanged)
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
