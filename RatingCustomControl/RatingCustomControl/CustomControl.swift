//
//  CustomControl.swift
//  RatingCustomControl
//
//  Created by Nick Nguyen on 2/20/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import UIKit


// @IBDesignable
class CustomControl: UIControl {

     var value : Int  = 1
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
   
    private let componentDimension : CGFloat = 40.0
    
    private let componentCount  = 5
    
    private let componentActiveColor : UIColor = .black
    
    private let componentInActiveColor : UIColor = .gray
   
    var labels : [UILabel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        for i in 1 ... componentCount {
            let label : UILabel = {
                let label = UILabel()
                label.tag = i
                label.frame.size  = CGSize(width: componentDimension, height: componentDimension)
                label.font = UIFont.boldSystemFont(ofSize: 32)
                label.text = "⭑"
                label.textAlignment = .center
                label.textColor = label.tag == 1 ? componentActiveColor : componentInActiveColor
                return label
                
            }()
            
          
            switch label.tag {
            case 1:
                label.frame.origin = CGPoint(x: 8.0, y: 0)
            case 2:
                label.frame.origin = CGPoint(x: componentDimension + 16.0, y: 0)
            case 3:
                label.frame.origin = CGPoint(x: componentDimension + 64.0, y: 0)
            case 4:
                label.frame.origin = CGPoint(x: componentDimension + 112.0, y: 0)
            case 5:
                label.frame.origin = CGPoint(x: componentDimension + 160.0, y: 0)
            default:
                break
            }
            addSubview(label)
            labels.append(label)
            
        }
        
    }
    
    
     var isTrigged = true
   // MARK: - Touch Tracking
    private func updateValue(at touch: UITouch) {
        for label in labels {
        label.textColor = label.tag <= value ? componentActiveColor : componentInActiveColor
            
            let touchPoint = touch.location(in: label)
            if label.bounds.contains(touchPoint) {
                label.performFlare()
                  value = label.tag
              sendActions(for: [.valueChanged])
        }
    }
       
                       
    }
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
          updateValue(at: touch)
      
        return true
    }
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside])
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
            updateValue(at: touch)
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: .touchUpOutside)
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
