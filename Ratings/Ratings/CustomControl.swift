//
//  CustomControl.swift
//  Ratings
//
//  Created by Niranjan Kumar on 11/7/19.
//  Copyright © 2019 Nar Kumar. All rights reserved.
//

import UIKit

class CustomControl: UIControl {

    // MARK: - Properties

    var value: Int = 1
    var labels: [UILabel] = []
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
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
    
    // MARK: - Functions

    
    func setup() {
        
        for star in 1...componentCount {
            let space: CGFloat = 8
            
            
            let starLabel = UILabel(frame: CGRect(x: CGFloat(star - 1) * componentDimension + CGFloat(star) * space, y: 0, width: componentDimension, height: componentDimension))
          
            starLabel.font = UIFont.boldSystemFont(ofSize: 32)
            starLabel.text = "✭"
            starLabel.textAlignment = .center
            starLabel.textColor = componentInactiveColor
            starLabel.tag = star
            
            self.viewWithTag(star)
            self.addSubview(starLabel)
            labels.append(starLabel)
        }
    }
    
    
    func updateValue(at touch: UITouch) {
        for star in labels.indices {
            if labels[star].frame.contains(touch.location(in: self)) {
                labels[star].performFlare()
                value = labels[star].tag
                for oneStar in labels.indices {
                    if oneStar <= star {
                        labels[oneStar].textColor = componentActiveColor
                    } else {
                        labels[oneStar].textColor = componentInactiveColor
                    }
                }
                sendActions(for: .valueChanged)
            }
        }
    }

    
    // MARK: - Touch Tracking

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)

        return true
    }

    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchLocation = touch.location(in: self)

        if bounds.contains(touchLocation) {
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragInside, .touchDragOutside])
        }

        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)

        guard let touch = touch else { return }

        let touchLocation = touch.location(in: self)

        if bounds.contains(touchLocation) {
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchUpInside, .touchUpOutside])
        }
    }

    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
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
