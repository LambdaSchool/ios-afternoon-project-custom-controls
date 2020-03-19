//
//  CustomControl.swift
//  StarRating
//
//  Created by Lambda_School_Loaner_259 on 3/19/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomControl: UIControl {
    
    // MARK: - Properties
    static var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    var ratingArray: [UILabel] = []
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - View lifecycle
    func setup() {
        //backgroundColor = .clear
        
        for i in 1...5 {
            let label = UILabel()
            addSubview(label)
            label.tag = i
            if i == 1 {
                label.frame = CGRect(x: 8.0, y: 0.0, width: componentDimension, height: componentDimension)
                label.textColor = componentActiveColor
            } else {
                label.frame = CGRect(x: (CGFloat(i) * 8.0) + ((CGFloat(i) - 1.0) * componentDimension),
                                                     y: CGFloat(0.0),
                                                     width: componentDimension,
                                                     height: componentDimension)
                label.textColor = componentInactiveColor
            }
            label.font = .boldSystemFont(ofSize: 32.0)
            label.textAlignment = .center
            label.text = "✮"
            ratingArray.append(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    func updateValue(at touch: UITouch) {
        for label in ratingArray {
            if label.frame.contains(touch.location(in: self)) {
                CustomControl.value = label.tag
                for i in 0..<ratingArray.count {
                    if ratingArray[i].tag <= CustomControl.value {
                        ratingArray[i].textColor = componentActiveColor
                    } else {
                        ratingArray[i].textColor = componentInactiveColor
                    }
                    sendActions(for: .valueChanged)
                }
            }
        }
    }
    
    // MARK: - Actions
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        performFlare()
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if self.bounds.contains(touchPoint) {
            let storedValue = CustomControl.value
            updateValue(at: touch)
            if storedValue != CustomControl.value {
                performFlare()
            }
            sendActions(for: [.touchDragInside, .touchDragOutside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if self.bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside, .touchUpOutside, .valueChanged])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
}

extension UIView {
    // Flare view animation sequence
    func performFlare() {
        func flare() { transform = CGAffineTransform(scaleX: 1.6, y: 1.6)}
        func unflare() { transform = .identity}
        
        UIView.animate(withDuration: 0.3,
                       animations: { flare() },
                       completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
    }
}

