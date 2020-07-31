//
//  CustomControl.swift
//  custom
//
//  Created by ronald huston jr on 7/4/20.
//  Copyright © 2020 HenryQuante. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1
    var starLabels: [UILabel] = []
    
    //  components
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.darkGray
    
    //  auto layout
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        for index in 1...componentCount {
            
            //  create five labels
            let label = UILabel()
            
            //  set each label's frame size [square]
            //  lay out the labels in a row with 8 points between each one
            let widthOfSpacing = CGFloat(index * 8)
            let widthOfComponents = componentDimension * CGFloat(index - 1)
            let origin = CGPoint(x: widthOfComponents + widthOfSpacing, y: 0)
            let size = CGSize(width: componentDimension, height: componentDimension)
            label.frame = CGRect(origin: origin, size: size)
            label.tag = index
            
            //  set the font, text, & alignment
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            label.text = "☆"
            label.textAlignment = .center
            //  set the label's text color to either active or inactive component color
            label.textColor = (index == 1) ? componentActiveColor : componentInactiveColor
            
            //  add each label as a subview
            addSubview(label)
            
            //  store each label into a local array
            starLabels.append(label)
        }
        
    }
    
    func updateValue(at touchPoint: CGPoint) {
        
    //  handle touches by checking to see whether they intersect with any label subviews
        
        for starLabel in starLabels where starLabel.frame.contains(touchPoint) {
        //  implement a loop that iterates through your component labels
        //  and detect whether each touch's location
            guard value != starLabel.tag else { return }
            
            //  when a touch overlaps a label, set the control's value to that tag
            value = starLabel.tag
            
            //  update the label colors to reflect the current touch
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
        //  send an action for for valueChanged
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
        
        //  make sure you have a valid touch and return if not
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        //  check whether the touch is inside view bounds
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
    
    //  the sentActions(for:) method you'll call from these handlers is what makes a control a control.
    //  sending actions generates the events that you use in IB with target-action.
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
