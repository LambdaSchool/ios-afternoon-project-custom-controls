//
//  File.swift
//  StarRating
//
//  Created by Gi Pyo Kim on 10/10/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    var value: Int = 1
    var stars: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 7
    private let componentActiveColor = UIColor.black
    private let componentInactiveColor = UIColor.gray
    
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }
    func setup() {
        for i in 1...componentCount {
            let star = UILabel()
            star.tag = i
            
            star.translatesAutoresizingMaskIntoConstraints = false
            addSubview(star)
            
            NSLayoutConstraint.activate([
                star.heightAnchor.constraint(equalToConstant: componentDimension),
                star.widthAnchor.constraint(equalToConstant: componentDimension),
                
                star.topAnchor.constraint(equalTo: topAnchor),
                star.leadingAnchor.constraint(equalTo: leadingAnchor, constant: CGFloat(8 * i) + componentDimension * CGFloat(i - 1))
            ])
            
            star.font = UIFont(name: "bold system font", size: 32)
            star.text = "\u{272D}"
            star.textAlignment = .center
            
            if i == 1 {
                star.textColor = componentActiveColor
            } else {
                star.textColor = componentInactiveColor
            }
            
            stars.append(star)
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        if bounds.contains(touch.location(in: self)) {
            updateValue(at: touch)
        }
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        if bounds.contains(touch.location(in: self)) {
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
        
        if bounds.contains(touch.location(in: self)) {
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
        for i in stars.indices {
            if stars[i].frame.contains(touch.location(in: self)) {
                
                for j in stars.indices {
                    if j <= i {
                        stars[j].textColor = componentActiveColor
                    } else {
                        stars[j].textColor = componentInactiveColor
                    }
                }
                
                value = stars[i].tag
                stars[i].performFlare()
                sendActions(for: .valueChanged)
            }
        }
    }
    
}

extension UIView {
  // "Flare view" animation sequence
  func performFlare() {
    func flare()   { transform = CGAffineTransform(scaleX: 0.8, y: 0.8) }
    func unflare() { transform = .identity }
    
    UIView.animate(withDuration: 0.3,
                   animations: { flare() },
                   completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
  }
}
