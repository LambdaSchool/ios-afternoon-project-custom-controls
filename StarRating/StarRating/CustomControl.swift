//
//  CustomControl.swift
//  StarRating
//
//  Created by Shawn Gee on 3/19/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

@IBDesignable
class CustomControl: UIControl {

    // MARK: - Properties
    
    @IBInspectable
    var value: Int = 1 {
        didSet {
            if oldValue != value {
                updateComponents()
                sendActions(for: .valueChanged)
            }
        }
    }
    
    @IBInspectable
    var rightToLeft: Bool = false {
        didSet {
            if rightToLeft {
                layer.transform = CATransform3DMakeRotation(.pi, 0, 1, 0)
            } else {
                layer.transform = CATransform3DIdentity
            }
        }
    }
    
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    // MARK: - Private

    private let componentDimension: CGFloat = 40
    private let componentPadding: CGFloat = 8
    private let componentCount = 5
    private var componentFlareEnabled = false
    
    private var components = [UIImageView]()
    
    
    private func setup() {
        var x = componentPadding
        
        for i in 1...componentCount {
            let starImage = i <= value ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
            let star = UIImageView(image: starImage)
            star.contentMode = .scaleAspectFit
            
            components.append(star)
            
            addSubview(star)
            star.frame = CGRect(x: x, y: 0, width: componentDimension, height: componentDimension)
            
            x += componentDimension + componentPadding
        }
    }
    
    private func updateComponents() {
        for i in 0..<components.count {
            components[i].image = i < value ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
            if i + 1 == value && componentFlareEnabled { components[i].performFlare() }
        }
    }
    
    private func updateValue(at touch: UITouch) {
        for i in 0..<components.count {
            let touchPoint = touch.location(in: components[i])
            
            if components[i].bounds.contains(touchPoint) {
                value = i + 1
                break
            }
        }
    }
    
    
    // MARK: - Touch Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        componentFlareEnabled = true
        updateValue(at: touch)
        sendActions(for: .touchDown)
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
    
    
    // MARK: - Size
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * componentPadding
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }

}

extension UIView {
  // "Flare view" animation sequence
  func performFlare() {
    UIView.animate(withDuration: 0.2, delay: 0, options: [.autoreverse], animations: {
        self.transform = .init(scaleX: 1.2, y: 1.2)
        self.transform = self.transform.rotated(by: -0.2)
    }) { _ in
        self.transform = .identity
    }
  }
}
