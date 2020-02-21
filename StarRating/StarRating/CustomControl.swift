//
//  CustomControl.swift
//  StarRating
//
//  Created by Tobi Kuyoro on 20/02/2020.
//  Copyright © 2020 Tobi Kuyoro. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    var labels: [UILabel] = []
    
    // MARK: - View Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        for i in 1...componentCount {
            let label = UILabel(frame: CGRect(x: CGFloat(i) * 8 + (CGFloat(i) - 1) * componentDimension,
                                              y: 0.0,
                                              width: componentDimension,
                                              height: componentDimension))
            label.tag = i
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
            label.text = "⭑"
            
            if label.tag == 1 {
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
    
    // MARK: - Touch Tracking
    
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
        guard let touch = touch else { return }
        if bounds.contains(touch.location(in: self)) {
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
            return
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    // MARK: - Change Star Color
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        for label in labels {
            if label.frame.contains(touchPoint) {
                value = label.tag
                sendActions(for: [.valueChanged])
            }
        }
        switch value {
        case 1:
            labels[0].textColor = componentActiveColor
            labels[1].textColor = componentInactiveColor
            labels[2].textColor = componentInactiveColor
            labels[3].textColor = componentInactiveColor
            labels[4].textColor = componentInactiveColor
        case 2:
            labels[0].textColor = componentActiveColor
            labels[1].textColor = componentActiveColor
            labels[2].textColor = componentInactiveColor
            labels[3].textColor = componentInactiveColor
            labels[4].textColor = componentInactiveColor
            
        case 3:
            labels[0].textColor = componentActiveColor
            labels[1].textColor = componentActiveColor
            labels[2].textColor = componentActiveColor
            labels[3].textColor = componentInactiveColor
            labels[4].textColor = componentInactiveColor
        case 4:
            labels[0].textColor = componentActiveColor
            labels[1].textColor = componentActiveColor
            labels[2].textColor = componentActiveColor
            labels[3].textColor = componentActiveColor
            labels[4].textColor = componentInactiveColor
        case 5:
            labels[0].textColor = componentActiveColor
            labels[1].textColor = componentActiveColor
            labels[2].textColor = componentActiveColor
            labels[3].textColor = componentActiveColor
            labels[4].textColor = componentActiveColor
        default:
            break
        }
    }
}
