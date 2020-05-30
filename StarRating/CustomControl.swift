//
//  CustomControl.swift
//  StarRating
//
//  Created by Kenneth Jones on 5/29/20.
//  Copyright © 2020 Kenneth Jones. All rights reserved.
//

import UIKit

@IBDesignable
class CustomControl: UIControl {
    
    var value = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    private func setup() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        addSubview(stackView)
        
        var labelArray: [UILabel] = []
        for tag in 1...componentCount {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.tag = tag
            label.frame.size = CGSize(width: componentDimension, height: componentDimension)
            label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
            label.text = "✩"
            label.textAlignment = .center
            if tag == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            labelArray.append(label)
            stackView.addArrangedSubview(label)
        }
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    private func updateValue(at touch: UITouch) {
        
    }

    // MARK: - Touch Tracking
        
        override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
            updateValue(at: touch)
            return true
        }
        
        override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
            let touchPoint = touch.location(in: self)
            if bounds.contains(touchPoint) {
                sendActions(for: [.touchDragInside])
                updateValue(at: touch)
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
                sendActions(for: [.touchUpInside])
                updateValue(at: touch)
            } else {
                sendActions(for: [.touchUpOutside])
            }
        }
        
        override func cancelTracking(with event: UIEvent?) {
            sendActions(for: [.touchCancel])
        }

}
