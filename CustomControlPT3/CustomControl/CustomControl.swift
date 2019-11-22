//
//  CustomControl.swift
//  CustomControl
//
//  Created by Jessie Ann Griffin on 9/26/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit
/*
 Create a new Swift file using File > New File. Name it CustomControl.swift.
In the file, import UIKit and create a new type (called CustomControl) that you subclass from UIControl.
*/
class CustomControl: UIControl {

    var value: Int = 1
    var stars: [UILabel] = []
 
    private let componentDimension: CGFloat = 40.0
    private let componentCount: UInt = 5
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    private let componentDistance: CGFloat = 8.0
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    
    func setup() {
        for i in 0..<componentCount {
            let label = UILabel()
//            label.translatesAutoresizingMaskIntoConstraints = false
            addSubview(label)
            
            label.tag = Int(i + 1)
            if i == 0 {
                label.frame = CGRect(x: componentDistance, y: 0.0,
                                     width: componentDimension, height: componentDimension)
            } else {
                label.frame = CGRect(x: (componentDimension * CGFloat(i)) + (componentDistance * CGFloat(i + 1)), y: 0.0,
                                     width: componentDimension, height: componentDimension)
            }
            print("\(i): \(label.frame.minX), \(label.frame.minY)" )

            if i == 0 {
                label.textColor = componentActiveColor
            } else {
                label.textColor = componentInactiveColor
            }
            
            label.font = .boldSystemFont(ofSize: 32.0)
            label.text = "✭"
            label.textAlignment = .center
            stars.append(label)
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
        
        let touchPoint = touch.location(in: self)
        if touchPoint.x <= bounds.maxX && touchPoint.y <= bounds.maxY {
            updateValue(at: touch)
            sendActions(for: .touchDragInside)
        } else {
            sendActions(for: .touchDragOutside)
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if touchPoint.x <= bounds.maxX && touchPoint.y <= bounds.maxY {
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
        
        let touchPoint = touch.location(in: self)
        
        for star in stars {
            if touchPoint.x <= star.frame.maxX && touchPoint.y <= star.frame.maxY {
                self.value = star.tag
                star.textColor = componentActiveColor
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
