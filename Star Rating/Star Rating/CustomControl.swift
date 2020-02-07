//
//  CustomControl.swift
//  Star Rating
//
//  Created by Sal Amer on 2/6/20.
//  Copyright © 2020 Sal Amer. All rights reserved.
//

import UIKit

@IBDesignable
class CustomControl: UIControl {

    var value: Int = 1
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    private var startLabels: [UILabel] = []
    
    //MARK: -- Initializers
   //initialize from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    //from story board
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
 
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
    
    func setup() {
        for stars in 1...componentCount {
            let label = UILabel()
            label.tag = stars
            label.viewWithTag(1)?.frame = CGRect(x: 8.0, y: 0, width: componentDimension, height: componentDimension)
            label.viewWithTag(2)?.frame = CGRect(x: componentDimension + 16, y: 0, width: componentDimension, height: componentDimension)
            label.viewWithTag(3)?.frame = CGRect(x: componentDimension * 2 + 24, y: 0, width: componentDimension, height: componentDimension)
            label.viewWithTag(4)?.frame = CGRect(x: componentDimension * 3 + 32, y: 0, width: componentDimension, height: componentDimension)
            label.viewWithTag(5)?.frame = CGRect(x: componentDimension * 4 + 40, y: 0, width: componentDimension, height: componentDimension)
            label.font = UIFont.boldSystemFont(ofSize: 32)
            label.text = "☆"
            label.textAlignment = .center
            if value == 1 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            addSubview(label)
            startLabels.append(label)
        }
        
        
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    
    //MARK: -- Touch Handlers
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        
        return true
        
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside, .touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside, .touchUpOutside])
        }
         
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .touchDragInside])
        } else {
            sendActions(for: [.touchUpOutside, .touchDragOutside])
        }

        
    }
 
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        for label in startLabels {
            if label.frame.contains(touchPoint) {
                value = label.tag
                label.performFlare()
                sendActions(for: .valueChanged)
            }
            if label.tag <= value {
                label.textColor = componentActiveColor
                label.performFlare()
                label.text = "★"
            } else {
                label.textColor = componentInactiveColor
                label.text = "☆"
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
