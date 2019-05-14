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
	var maxValue = 5 {
		willSet {
			precondition(newValue > 0)
		}
		didSet {
			setup()
		}
	}
	private var componentActiveColor = UIColor.black
	private let componentInactiveColor = UIColor.gray
	private var stars = [UILabel]()
	override var tintColor: UIColor! {
		get {
			return componentActiveColor
		}
		set {
			componentActiveColor = newValue
			internalSetValue(to: value)
		}
	}

	override var intrinsicContentSize: CGSize {
		let componentsWidth = CGFloat(maxValue) * componentDimension
		let componentsSpacing = CGFloat(maxValue + 1) * 8
		let width = componentsWidth + componentsSpacing
		return CGSize(width: width, height: componentDimension)
	}

	// MARK: - Initializer stuff
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}

	private func setup() {
		for star in stars {
			star.removeFromSuperview()
		}
		stars.removeAll()
		for index in 1...maxValue {
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

	private func updateValue(at touch: UITouch) {
		for star in stars.reversed() {
			let location = touch.location(in: star)
			if star.bounds.contains(location) && star.tag != value {
				internalSetValue(to: star.tag)
				return
			}
		}
		let location = touch.location(in: self)
		if location.x < bounds.origin.x && location.y >= bounds.origin.y && location.y <= bounds.maxY {
			internalSetValue(to: 0)
		}
	}

	// MARK: - internal setters

	private func internalSetValue(to value: Int, sendAction: Bool = true, animate: Bool = true) {
		var animate = animate
		if animate && value == self.value {
			animate = false
		}
		self.value = value
		if sendAction {
			sendActions(for: .valueChanged)
		}
		for star in stars {
			if star.tag <= value {
				if animate {
					let newColor = componentActiveColor
					star.transform = .identity
					star.performFlare(afterDelay: Double(star.tag) * 0.03) {
						star.textColor = newColor
					}
				} else {
					star.textColor = componentActiveColor
				}
			} else {
				star.textColor = componentInactiveColor
			}
		}
	}

	func setValue(to value: Int) {
		internalSetValue(to: value, sendAction: false, animate: false)
	}
}

extension UIView {
	func performFlare(afterDelay delay: TimeInterval, midPoint: @escaping () -> Void) {
		func flare() { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
		func unflare() { transform = .identity }

		UIView.animate(withDuration: 0.13, delay: delay, options: [.allowAnimatedContent, .beginFromCurrentState, .curveLinear], animations: {
			flare()
			midPoint()
		}) { _ in
			UIView.animate(withDuration: 0.1, animations: {
				unflare()
			})
		}
	}
}
