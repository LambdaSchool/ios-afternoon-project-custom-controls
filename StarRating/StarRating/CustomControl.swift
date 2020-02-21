//
//  CustomControl.swift
//  StarRating
//
//  Created by Chris Gonzales on 2/20/20.
//  Copyright © 2020 Chris Gonzales. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    
    var value: Int = 1
    private var componentDimension: CGFloat = 40.0
    private var componentCount: CGFloat = 5
    private var componentActiveColor: UIColor = .black
    private var componentInactiveColor: UIColor = .gray
    var labelArray: [UILabel] = []
    var isAnimating = false
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Methods
    
    func updateValue(at touch: UITouch){
        for label in labelArray{
            let touchPoint = touch.location(in: self)
            if label.frame.contains(touchPoint){
                value = label.tag
                label.textColor = componentActiveColor
                sendActions(for: .valueChanged)
            }
            if label.tag <= value{
                label.performFlare()
            }
        }
    }
    
    // MARK: - Set Up Methods
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    private func setup(){
        frame = CGRect(origin: .zero, size: intrinsicContentSize)
        for index in 1...Int(componentCount) {
            let adjustedConstant = CGFloat(index - 1) * componentDimension + CGFloat(index) * 8.0
            
            let newLabel = UILabel(frame: CGRect(x: adjustedConstant,
                                                 y: 0,
                                                 width: componentDimension,
                                                 height: componentDimension))
            addSubview(newLabel)
            newLabel.tag = index
            newLabel.font = UIFont.boldSystemFont(ofSize: 32.0)
            newLabel.text = "⭐️"
            if newLabel.tag == 1 {
                newLabel.textColor = componentActiveColor
            } else {
                newLabel.textColor = componentInactiveColor
            }
            labelArray.append(newLabel)
        }
    }
    
    // MARK: - Touch Handlers
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint){
            sendActions(for: [.touchDragInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint){
            sendActions(for: [.touchUpInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
}
