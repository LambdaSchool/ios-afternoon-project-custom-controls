//
//  CustomControl.swift
//  Custom Controls
//
//  Created by Isaac Lyons on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    //MARK: Init
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        setup()
    }
    
    //MARK: Properties
    
    var value: Int = 1
    var labels: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    //MARK: Methods
    
    private func setup() {
        
        frame = CGRect(origin: .zero, size: intrinsicContentSize)

        for i in 0...4 {
            let label = UILabel()
            label.tag = i + 1
            
            label.frame = CGRect(x: 8 * CGFloat(i + 1) + CGFloat(i) * componentDimension, y: 0, width: componentDimension, height: componentDimension)
            
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.textColor = (i == 0 ? componentActiveColor : componentInactiveColor)
            label.textAlignment = .center
            label.text = "✧"
            
            addSubview(label)
            
            labels.append(label)
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    //MARK: Touch Handlers
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: .valueChanged)
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: .touchDragInside)
        } else {
            sendActions(for: .touchDragOutside)
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: .touchUpInside)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }

    func updateValue(at touch: UITouch) {
        for label in labels {
            if label.bounds.contains(touch.location(in: label)) {
                value = label.tag
                
                label.performFlare()
                
                for label in labels {
                    if label.tag > value {
                        label.textColor = componentInactiveColor
                    } else {
                        label.textColor = componentActiveColor
                    }
                }
                
                sendActions(for: .valueChanged)
            }
        }
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
