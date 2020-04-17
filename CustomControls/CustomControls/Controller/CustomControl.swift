//
//  CustomControl.swift
//  CustomControls
//
//  Created by Claudia Contreras on 4/16/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    var labels: [UILabel] = []
    
    // Private Constants
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        setup()
    }
    
    
    
    func setup() {
        // Add 5 labels
        for i in 1...5 {
            //Create the label
            let label = UILabel()
            
            //Add it to the array
            labels.append(label)
            
            // Add it to the subview
            addSubview(label)
            
            // Set up it's own tag to differentiate
            label.tag = i
            
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "☆"
            label.textAlignment = .center
            //Set the color of the star
            if i == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
            //Set the size and location of the labels
            let padding = CGFloat(8.0 * CGFloat(i))
            label.frame = CGRect(x: padding + (componentDimension * CGFloat(i - 1)), y: 0, width: componentDimension, height: componentDimension)
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        //Set the touchPoint
        let touchPoint = touch.location(in: self)
        //Check to see if it's in the bounds
        if bounds.contains(touchPoint) {
            sendActions(for: .touchDragInside)
            updateValue(at: touch)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        
        //Set the touchPoint
        let touchPoint = touch.location(in: self)
        //Check to see if it's in the bounds
        if bounds.contains(touchPoint) {
            sendActions(for: .touchUpInside)
            updateValue(at: touch)
        } else {
            sendActions(for: .touchUpOutside)
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(at touch: UITouch) {
        for label in labels {
            let touchPoint = touch.location(in: label)
            if label.bounds.contains(touchPoint) {
                value = label.tag
                sendActions(for: .valueChanged)
                label.textColor = componentActiveColor
                label.performFlare()
                
                for i in 1...label.tag {
                    let label = labels.filter { $0.tag == i}.first
                    if let label = label {
                        label.textColor = componentActiveColor
                    }
                }
            } else {
                label.textColor = componentInactiveColor
            }
        }
    }
}

// MARK: Extension
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
