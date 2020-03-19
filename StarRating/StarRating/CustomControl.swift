//
//  CustomControl.swift
//  StarRating
//
//  Created by Karen Rodriguez on 3/19/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    
    var value: Int = 1
    var labels: [UILabel] = []
    
    // MARK: - Private Properties
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: Int = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Methods
    
    private func setup() {
        for tag in 0...4 {
            let newLabel = UILabel()
            newLabel.tag = tag + 1
            if tag + 1 == 1 {
                newLabel.textColor = componentActiveColor
                newLabel.frame = CGRect(x: 8.0, y: 0.0, width: componentDimension, height: componentDimension)
            } else {
                newLabel.textColor = componentInactiveColor
                newLabel.frame = CGRect(x: labels.last!.frame.maxX + 8.0, y: 0.0, width: componentDimension, height: componentDimension)
            }
            newLabel.font = UIFont.boldSystemFont(ofSize: 32.0)
            newLabel.text = "✭"
            newLabel.textAlignment = .center
            labels.append(newLabel)
            addSubview(newLabel)
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    private func updateValue(at touch: UITouch) {
        
    }
    
    // MARK: - Control Methods
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if self.bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside])
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
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
        
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
}
