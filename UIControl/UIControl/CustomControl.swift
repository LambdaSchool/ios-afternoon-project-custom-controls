//
//  CustomControl.swift
//  UIControl
//
//  Created by Lydia Zhang on 3/19/20.
//  Copyright © 2020 Lydia Zhang. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  // "Flare view" animation sequence
  func performFlare() {
    func flare()   {
        transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
        layer.backgroundColor = CGColor(srgbRed: 0.91, green: 0.58, blue: 0.47, alpha: 0.5)
    }
    func unflare() {
        transform = .identity
    }
    UIView.animate(withDuration: 0.3,
                   animations: { flare() },
                   completion: { _ in UIView.animate(withDuration: 0.1) {unflare()}})
  }
}
class CustomControl: UIControl {
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount: Int = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    var starArray: [UILabel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    func setUp() {
        
        for count in 1...componentCount {
            let label = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: componentDimension, height: componentDimension)))
            
            label.text = "★"
            label.textColor = componentInactiveColor
            label.tag = count
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.isUserInteractionEnabled = false
            
            starArray.append(label)
            
        }
        
        let stackView = UIStackView(arrangedSubviews: starArray)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.isUserInteractionEnabled = false
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 8
        
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
    }
    
    //layer.backgroundColor = CGColor(srgbRed: 0.91, green: 0.58, blue: 0.47, alpha: 0.5)
    func valueChanged(at touch: UITouch) {
        for label in starArray {
            if touch.location(in: self).x >= label.frame.minX {
                label.performFlare()
                label.textColor = componentActiveColor
                value = label.tag
            } else {
                label.textColor = componentInactiveColor
                label.layer.backgroundColor = CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 0.5)
            }
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        valueChanged(at: touch)
        return true
    }
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        if bounds.contains(touch.location(in: self)) {
            valueChanged(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer {
            super.endTracking(touch, with: event)
        }
        guard let touch = touch else {return}
        if bounds.contains(touch.location(in: self)) {
            valueChanged(at: touch)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
}
