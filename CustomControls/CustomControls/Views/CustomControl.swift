//
//  CustomControl.swift
//  CustomControls
//
//  Created by Matthew Martindale on 4/15/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = #colorLiteral(red: 0.08015998453, green: 0.2788668573, blue: 0.3865089417, alpha: 1)
    private let componentInactiveColor: UIColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    var labelArray: [UILabel] = []
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    func setUp() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        var labelTag = 0
        for _ in 1...5 {
            let label = UILabel()
            labelTag += 1
            label.tag = labelTag
            
            label.text = "★"
            label.textColor = componentInactiveColor
            addSubview(label)
            labelArray.append(label)
            
            label.frame.size.width = componentDimension
            label.frame.size.height = componentDimension
            label.font = UIFont.boldSystemFont(ofSize: 32)
            
            stackView.addArrangedSubview(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        for label in labelArray {
            if label.bounds.contains(touchPoint) {
                value = label.tag
                label.textColor = componentActiveColor
                sendActions(for: .valueChanged)
            }
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        updateValue(at: touch)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDown])
        }
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .touchDragOutside])
            updateValue(at: touch)
        } else {
            sendActions(for: .touchDragOutside)
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer {
            super.endTracking(touch, with: event)
        }
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .touchUpOutside])
        } else {
            sendActions(for: .touchDragOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
        super.cancelTracking(with: event)
    }
    
    
}
