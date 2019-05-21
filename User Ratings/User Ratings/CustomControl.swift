//
//  CustomControl.swift
//  User Ratings
//
//  Created by Jonathan Ferrer on 5/21/19.
//  Copyright © 2019 Jonathan Ferrer. All rights reserved.
//

import UIKit

class CustomControl: UIControl {

    var labels: [UILabel] = []
    var value: Int = 1

    private let componentDimension: CGFloat = 40.0
    private let componentCount = 5
    private let componentActiveColor: UIColor = .green
    private let componentInactiveColor: UIColor = .gray

    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        setup()
    }

    func setup() {
        for label in 1...5 {
            let addLabel = UILabel()
            self.addSubview(addLabel)
            addLabel.tag = label
            addLabel.text = "✭"
            addLabel.font = .systemFont(ofSize: 32, weight: .bold)
            addLabel.textAlignment = .center
            labels.append(addLabel)
        }
        labels[0].frame = CGRect(x: 8.0, y: 0, width: componentDimension, height: componentDimension)
        labels[0].textColor = componentActiveColor
        labels[1].frame = CGRect(x: componentDimension + 16.0, y: 0.0, width: componentDimension, height: componentDimension)
        labels[2].frame = CGRect(x: componentDimension * 2 + 24.0, y: 0.0, width: componentDimension, height: componentDimension)
        labels[3].frame = CGRect(x: componentDimension * 3 + 32.0, y: 0.0, width: componentDimension, height: componentDimension)
        labels[4].frame = CGRect(x: componentDimension * 4 + 40.0, y: 0.0, width: componentDimension, height: componentDimension)
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
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }

    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer {
            super.endTracking(touch, with: event)
        }

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

    func updateValue(at touch: UITouch) {
        let touchPoint = touch.location(in: self)

        for label in labels {
            if label.frame.contains(touchPoint) {
                if value != label.tag {
                    value = label.tag

                    for label in labels {
                        if label.tag <= value {
                            label.textColor = componentActiveColor
                        } else {
                            label.textColor = componentInactiveColor
                        }
                    }

                    sendActions(for: .valueChanged)
                }
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
