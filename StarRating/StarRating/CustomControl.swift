//
//  CustomControl.swift
//  StarRating
//
//  Created by Chris Dobek on 4/16/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit

@IBDesignable
class CustomControl: UIControl {
    
    var value: Int = 1
    var starLabels: [UILabel] = []
    
    // Components
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
   
    
    //Auto Layout
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        for index in 1...componentCount {
            //Creating the label
                   let label = UILabel()
            // Label Layout
                   let widthOfSpacing = CGFloat(index * 8)
                   let widthOfComponentsSoFar = componentDimension * CGFloat(index - 1)
                   let origin = CGPoint(x: widthOfComponentsSoFar + widthOfSpacing, y: 0)
                   let size = CGSize(width: componentDimension, height: componentDimension)
                   label.frame = CGRect(origin: origin, size: size)
                   label.tag = index
            // Setting the Label
                   label.font = UIFont.boldSystemFont(ofSize: 32.0)
                   label.text = "☆"
                   label.textAlignment = .center
                   label.textColor = (index == 1) ? componentActiveColor : componentInactiveColor
                   
                   addSubview(label)
                   starLabels.append(label)
               }
           }
        
    func updateValue(at touchPoint: CGPoint) {
        for starLabel in starLabels where starLabel.frame.contains(touchPoint) {
            guard value != starLabel.tag else { return }
            
            value = starLabel.tag
            starLabel.textColor = componentActiveColor
            starLabel.performFlare()
            break
        }
        
        for starLabel in starLabels where starLabel.tag < value {
            starLabel.textColor = componentActiveColor
        }
        for starLabel in starLabels where starLabel.tag > value {
            starLabel.textColor = componentInactiveColor
        }
        sendActions(for: [.valueChanged])
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        updateValue(at: touchPoint)
        sendActions(for: [.touchDown])
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touchPoint)
            sendActions(for: [.touchDragInside])
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
            updateValue(at: touchPoint)
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
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
