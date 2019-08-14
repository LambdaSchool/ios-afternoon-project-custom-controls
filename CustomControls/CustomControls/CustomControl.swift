//
//  CustomControl.swift
//  CustomControls
//
//  Created by Marlon Raskin on 8/13/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
	
	var value: Int = 1
	var labelArray: [UILabel] = []

	override var intrinsicContentSize: CGSize {
		let componentsWidth = CGFloat(componentCount) * componentDimension
		let componentsSpacing = CGFloat(componentCount + 1) * 8.0
		let width = componentsWidth + componentsSpacing
		return CGSize(width: width, height: componentDimension)
	}

	let componentDimension: CGFloat = 40.0
	let componentCount: CGFloat = 5
	let componentActiveColor = UIColor(red: 0.82, green: 0.99, blue: 0.01, alpha: 1.00)
	let componentINactiveColor = UIColor(red: 0.31, green: 0.40, blue: 0.57, alpha: 0.90)

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
		for label in labelArray {
			print(label.frame)
		}
	}

	func setup() {

		for labelIndex in 1...Int(componentCount) {
			let offset: CGFloat = CGFloat(labelIndex - 1) * componentDimension + CGFloat(labelIndex) * 8
			print(offset)
			let starLabel = UILabel(frame: CGRect(x: offset, y: 0,
												  width: componentDimension,
												  height: componentDimension))
			starLabel.text = "☆"
			starLabel.font = .boldSystemFont(ofSize: 32)
			starLabel.textAlignment = .center
			starLabel.tag = labelIndex
			if starLabel.tag == 1 {
				starLabel.textColor = componentActiveColor
			} else {
				starLabel.textColor = componentINactiveColor
			}
			self.addSubview(starLabel)
			labelArray.append(starLabel)
		}
	}

	func updateValue(at touch: UITouch) {

		for label in labelArray {
			let touchPoint = touch.location(in: self)
			if label.frame.contains(touchPoint) {
				value = label.tag
				for label in labelArray {
					if label.tag <= value {
						label.textColor = componentActiveColor
					} else {
						label.textColor = componentINactiveColor
					}
				}
			}
		}
	}
}

extension CustomControl {

	override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {

		updateValue(at: touch)
		sendActions(for: [.touchDown, .valueChanged])
		return true
	}

	override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		if bounds.contains(touch.location(in: self)) {
			updateValue(at: touch)
			sendActions(for: [.touchUpInside, .valueChanged])
		} else {
			sendActions(for: [.touchDragOutside])
		}
		return true
	}

	override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
		defer { super.endTracking(touch, with: event) }
		guard let touch = touch else { return }

		if bounds.contains(touch.location(in: self)) {
			updateValue(at: touch)
			sendActions(for: [.touchUpInside, .valueChanged])
		} else {
			sendActions(for: [.touchUpOutside])
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
