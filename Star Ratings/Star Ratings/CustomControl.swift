//
//  CustomControl.swift
//  Star Ratings
//
//  Created by Dillon P on 9/25/19.
//  Copyright © 2019 Lambda iOSPT2. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Int = 1 // default value of 1 is API facing i.e. customers can see
    var labels: [UILabel] = []
    
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: Int = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    // init for programmatic layouts
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    
    // init for storyboard layouts
    required init?(coder: NSCoder) { ///if this is done a storyboard, needs to run NSCoder in order to run
        super.init(coder: coder)
        setUpSubviews()
    }
    
    func setUpSubviews() {
        
        
        var count = 1
        var xPos: CGFloat = 16.0
        
        for _ in 0...4 {
            let label = UILabel()
            addSubview(label)
            label.tag = count
            
            if count == 1 {
                label.frame = CGRect(x: 8.0, y: 0.0, width: componentDimension, height: componentDimension)
                label.textColor = .systemYellow
            } else {
                label.frame = CGRect(x: xPos + componentDimension, y: 0.0, width: componentDimension, height: componentDimension)
                xPos += componentDimension + 8.0
                label.textColor = .lightText
            }
            
            label.font = .boldSystemFont(ofSize: 32.0)
            label.text = "★"
            label.textAlignment = .center
            labels.append(label)
            count += 1
        }
    }
    
    override var intrinsicContentSize: CGSize {
      let componentsWidth = CGFloat(componentCount) * componentDimension
      let componentsSpacing = CGFloat(componentCount + 1) * 8.0
      let width = componentsWidth + componentsSpacing
      return CGSize(width: width, height: componentDimension)
    }
    
    func updateValue(at touch: UITouch) {
        for star in labels {
            let touchPoint = touch.location(in: self)
            if star.frame.contains(touchPoint) {
                value = star.tag
                sendActions(for: .valueChanged)
            }
            
            if star.tag <= value {
                star.textColor = .systemYellow
            } else {
                star.textColor = .lightText
            }
        }
    }
    
    
    // MARK: - Touch Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside])
            updateValue(at: touch)
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
