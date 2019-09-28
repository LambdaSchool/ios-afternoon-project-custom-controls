//
//  CustomControl.swift
//  Star Rating
//
//  Created by Joel Groomer on 9/26/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    var value: Int = 1 { didSet { updateLabels() } }
    var labels: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        for i in 1...componentCount {
            let label = UILabel()
            label.tag = i
            addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.heightAnchor.constraint(equalToConstant: componentDimension).isActive = true
            label.widthAnchor.constraint(equalToConstant: componentDimension).isActive = true
            let offset = (40 * (i - 1)) + (8 * i)
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: CGFloat(offset)).isActive = true
            label.font = .boldSystemFont(ofSize: 32)
            label.text = "★"
            label.textAlignment = .center
            label.textColor = i > value ? componentInactiveColor : componentActiveColor
            labels.append(label)
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
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event)}
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: .touchUpOutside)
            return
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        for label in labels {
            let touchPoint = touch.location(in: label)
            if label.bounds.contains(touchPoint) {
                value = label.tag
            }
        }
    }
    
    func updateLabels() {
        for i in 1...componentCount {
            labels[i - 1].textColor =  i > value ? componentInactiveColor : componentActiveColor
        }
    }
}
