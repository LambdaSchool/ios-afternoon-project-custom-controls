//
//  CustomControl.swift
//  StarRating
//
//  Created by Gerardo Hernandez on 2/5/20.
//  Copyright © 2020 Gerardo Hernandez. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    var value: Int = 1
    
    var stars: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    private func setup() {
        for number in 1...componentCount {
            let label = UILabel()
            
            let labelSize = CGSize(width: componentDimension, height: componentDimension)
            let componentWidth = componentDimension * CGFloat(number - 1)
            let componentSpacing = CGFloat(number * 8)
            let labelOrigin = CGPoint(x: componentWidth + componentSpacing, y: 0)
            
            label.frame = CGRect(origin: labelOrigin, size: labelSize)
            label.tag = number
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.text = "☆t"
            label.textAlignment = .center
            label.textColor = (number == 1) ? componentActiveColor : componentInactiveColor
            
            addSubview(label)
            stars.append(label)
        }
        
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    private func updateValue(at touchPoint: CGPoint) {
        for star in stars where star.frame.contains(touchPoint) {
            guard value != star.tag else { return }
            
            value = star.tag
            star.textColor = componentActiveColor
            star.performFlare()
            break
        }
        for star in stars where star.tag < value {
            
            star.textColor = componentInactiveColor
            
        }
        sendActions(for: [.valueChanged])
        
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
               sendActions(for: [.touchUpOutside])
               
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
