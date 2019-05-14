//
//  StarControl.swift
//  Star Rating
//
//  Created by Michael Redig on 5/14/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class StarControl: UIControl {
	var value: Int = 1
	private let componentDimension = CGFloat(40)
	private let componentCount = 5
	private let componentActiveColor = UIColor.black
	private let componentInactiveColor = UIColor.gray
	private var stars = [UILabel]()


	override var intrinsicContentSize: CGSize {
		let componentsWidth = CGFloat(componentCount) * componentDimension
		let componentsSpacing = CGFloat(componentCount + 1) * 8
		let width = componentsWidth + componentsSpacing
		return CGSize(width: width, height: componentDimension)
	}

	// MARK: - Initializer stuff
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}

	private func setup() {

		for index in 1...componentCount {
			let xPos = (componentDimension + 8) * CGFloat(index) - componentDimension
			let starLabel = UILabel(frame: CGRect(x: xPos, y: 0, width: componentDimension, height: componentDimension))
			starLabel.text = ""
			starLabel.tag = index
			starLabel.textAlignment = .center
			starLabel.font = UIFont.boldSystemFont(ofSize: 32)
			starLabel.textColor = index == 1 ? componentActiveColor : componentInactiveColor
			addSubview(starLabel)
			stars.append(starLabel)
		}
	}

	// MARK: - Touch Handlers
	override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		updateValue(at: touch)
		sendActions(for: [.touchDown])
		return true
	}

	override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
		let location = touch.location(in: self)
		if bounds.contains(location) {
			updateValue(at: touch)
			sendActions(for: [.touchDragInside])
		} else {
			updateValue(at: touch)
			sendActions(for: [.touchDragOutside])
		}
		return true
	}

	override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
		if let touch = touch {
			let location = touch.location(in: self)
			if bounds.contains(location) {
				updateValue(at: touch)
				sendActions(for: [.touchUpInside])
			} else {
				sendActions(for: [.touchUpOutside])
			}
		}
	}

	override func cancelTracking(with event: UIEvent?) {
		sendActions(for: [.touchCancel])
	}

	func updateValue(at touch: UITouch) {
		for star in stars.reversed() {
			let location = touch.location(in: star)
			if star.bounds.contains(location) && star.tag != value {
				setValue(to: star.tag)
				return
			}
		}
		let location = touch.location(in: self)
		if location.x < bounds.origin.x {
			setValue(to: 0)
		}
	}

	func setValue(to value: Int) {
		self.value = value
		for star in stars {
			if star.tag <= value {
				star.textColor = componentActiveColor
			} else {
				star.textColor = componentInactiveColor
			}
		}
	}
}
