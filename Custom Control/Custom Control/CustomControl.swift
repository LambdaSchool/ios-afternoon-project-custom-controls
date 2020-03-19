//
//  CustomControl.swift
//  Custom Control
//
//  Created by Wyatt Harrell on 3/19/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

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

class CustomControl: UIControl {
    
    var value: Int = 1
    
    private let componentDimension: CGFloat = 40.0
    private let componentCount: CGFloat = 5
    private let componentActiveColor: UIColor = .black
    private let componentInactiveColor: UIColor = .gray
    
    var labels: [UILabel] = []
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        
        for number in 0...4 {
            let label = UILabel()
            label.tag = number + 1
            label.frame.size = CGSize(width: componentDimension, height: componentDimension)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = .systemFont(ofSize: 32.0, weight: .bold)
            label.textAlignment = .center
            label.text = "★"
            label.textColor = componentInactiveColor
            addSubview(label)
            labels.append(label)
        }
        
        /*
        labels[0].frame = CGRect(x: 8, y: 0.0, width: componentDimension, height: componentDimension)
        
        for number in 0...4 {
            labels[number].frame = CGRect(x: componentDimension + 16, y: 0.0, width: componentDimension, height: componentDimension)
        }
        */
        
        #warning("Constraints setup currectly?")
        labels[0].topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        labels[1].topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        labels[2].topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        labels[3].topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        labels[4].topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true

        NSLayoutConstraint.activate([
            labels[0].leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            labels[1].leadingAnchor.constraint(equalTo: labels[0].trailingAnchor, constant: 16),
            labels[2].leadingAnchor.constraint(equalTo: labels[1].trailingAnchor, constant: 16),
            labels[3].leadingAnchor.constraint(equalTo: labels[2].trailingAnchor, constant: 16),
            labels[4].leadingAnchor.constraint(equalTo: labels[3].trailingAnchor, constant: 16)
        ])
        
        labels[0].textColor = componentActiveColor
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
        if self.bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        if self.bounds.contains(touchPoint) {
            updateValue(at: touch)
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
    
    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)
        for item in labels {
            if item.frame.contains(touchPoint) && item.tag != value {
                let temp = item.tag
                // Tapped star and stars before it
                for i in 0...temp-1 {
                    labels[i].textColor = componentActiveColor
                    labels[i].performFlare()
                }
                // Stars after tapped star
                if temp != 5 {
                    for i in temp...4 {
                        labels[i].textColor = componentInactiveColor
                    }
                }
                value = item.tag
                sendActions(for: [.valueChanged])
            }
        }
    }
}
