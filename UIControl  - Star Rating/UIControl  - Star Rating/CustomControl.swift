//
//  CustomControl.swift
//  UIControl  - Star Rating
//
//  Created by Mark Poggi on 4/16/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    private var value: Int = 1
    private var star = UILabel()
    private var stars = [UILabel]()
    private var componentDimension: CGFloat = 40.0
    private var componentCount: Int = 5
    private var componentActiveColor: UIColor = .black
    private var componentInactiveColor: UIColor = .gray
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubviews()
    }
    private func setUpSubviews() {
        
        star.translatesAutoresizingMaskIntoConstraints = false
        
        
        for x in 0...4 {
            let star = (UILabel(frame: CGRect(x: (CGFloat(x) * componentDimension) + (CGFloat(x) * 8.0), y: 0, width: componentDimension, height: componentDimension)))
            
            star.text = "⭐︎"
            star.textAlignment = .center
            star.textColor = componentInactiveColor
            star.font = UIFont.systemFont(ofSize: 32)
            star.tag = x
            
            star.widthAnchor.constraint(equalTo: star.heightAnchor).isActive = true
            
            stars.append(star)
            print(star)
            addSubview(star)
            
        }
        stars[0].textColor = componentActiveColor
        
    }
    
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    // MARK: - Touch Tracking
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        let oldValue = value
        let value = star.tag
        
        for x in 0...4 {
            if stars[x].frame.contains(touchPoint) {
                stars[x].textColor = componentActiveColor
                print("true")
            } else {
                stars[x].textColor = componentInactiveColor
                print("false")
            }
        }
    }
    
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: [.touchDown, .valueChanged])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if frame.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .valueChanged])
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
        
    }
}
