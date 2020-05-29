//
//  CustomControl.swift
//  RatingCustomControl
//
//  Created by Clayton Watkins on 5/28/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    // MARK: - Properties
    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    var starLabels: [UILabel] = []
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        setUpViews()
    }
    
    // MARK: - Control Functions
    
    private func updateValue(at touch: UITouch){
        for label in starLabels{
            let touchpoint = touch.location(in: label)
            if label.bounds.contains(touchpoint) {
                self.value = label.tag
                sendActions(for: .valueChanged)
                label.textColor = componentActiveColor
                label.performFlare()
                
                for i in 1...label.tag {
                    let label = starLabels.filter { $0.tag == i}.first
                    if let label = label {
                        label.textColor = componentActiveColor
                    }
                }
            } else {
                label.textColor = componentInactiveColor
            }
        }
    }
    
    
    // MARK: - Setting Up Views
    private func setUpViews(){
        
        for n in 1...componentCount {
            let label = UILabel()
            label.tag = n
            starLabels.append(label)
            addSubview(label)
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "☆"
            label.textAlignment = .center
            
            if n == 1{
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
            let padding = CGFloat(8.0 * CGFloat(n))
            label.frame = CGRect(x: 64 + padding + (componentDimension * CGFloat(n-1)),
                                 y: 80,
                                 width: componentDimension,
                                 height: componentDimension)
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
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint){
            sendActions(for: [.touchDragInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint){
            sendActions(for: [.touchUpInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
}

extension UIView {
    // "Flare view" animation sequence
    func performFlare() {
        func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
        func unflare() { transform = .identity }
        
        UIView.animate(withDuration: 0.3,
                       animations: { flare() },
                       completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
    }
}
