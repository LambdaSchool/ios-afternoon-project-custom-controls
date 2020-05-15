//
//  CustomControl.swift
//  CustomControls_iOS17
//
//  Created by Stephanie Ballard on 5/14/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties -
    var value: Int = 1 {
        didSet {
            updateViews()
        }
    }
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    private var components: [UILabel] = []
    
    // MARK: - Initializers -
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        for i in 1...componentCount {
            let label = UILabel(frame: CGRect(x: CGFloat(i) * 8 + (CGFloat(i) - 1) * componentDimension,
                                              y: 0.0,
                                              width: componentDimension,
                                              height: componentDimension))
            label.translatesAutoresizingMaskIntoConstraints = true
            label.tag = i
            addSubview(label)
            components.append(label)
            label.font = UIFont.systemFont(ofSize: 32)
            label.text = "★"
            label.textAlignment = .center
            
            if i == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    func updateValue(at touch: UITouch) {
        for component in components {
            if component.frame.contains(touch.location(in: self)) {
                self.value = component.tag
            }
        }
    }
    
    private func updateViews() {
        for label in components {
            if label.tag <= self.value {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        //sendActions(for: .valueChanged)
        //updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        if bounds.contains(touch.location(in: self)) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: [.touchDragOutside])
            return
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
}
