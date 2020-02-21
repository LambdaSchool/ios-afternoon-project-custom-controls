//
//  CustomControl.swift
//  StarRating
//
//  Created by Enrique Gongora on 2/20/20.
//  Copyright © 2020 Enrique Gongora. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    //MARK: - Variables
    var value: Int = 1
    var componentDimension: CGFloat = 40.0
    var componentCount = 5
    var componentActiveColor = UIColor.black
    var componentInactiveColor = UIColor.gray
    var starArray: [UILabel] = []
    
    // MARK: - Initializers
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    //MARK: - Functions
    func setup() {
        for number in 1...componentCount {
            let label = UILabel(frame: CGRect(x: CGFloat(number) * 8 + (CGFloat(number) - 1) * componentDimension, y: 0.0, width: componentDimension, height: componentDimension))
            label.translatesAutoresizingMaskIntoConstraints = false
            label.tag = number
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = (number == 1) ? "🌟" : "☆"
            label.textAlignment = .center
            label.textColor = (number == 1) ? componentActiveColor : componentInactiveColor
            starArray.append(label)
            addSubview(label)
        }
    }
    
    func updateValue(at touch: UITouch) {
        
    }
    
    // This tells Auto Layout how big our custom control should be
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    // MARK: - Touch Handlers
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        sendActions(for: [.valueChanged])
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        guard let touch = touch else { return }
        if bounds.contains(touch.location(in: self)) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
            return
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
}
