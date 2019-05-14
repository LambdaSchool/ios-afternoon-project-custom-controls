//
//  StarControl.swift
//  Star Rating
//
//  Created by Michael Redig on 5/14/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

@IBDesignable class StarControl: UIControl {
	var value: Int = 1
	private let componentDimension = CGFloat(40)
	private let componentCount = 5
	private let componentActiveColor = UIColor.black
	private let componentInactiveColor = UIColor.gray

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}

	private func setup() {
		var stars = [UILabel]()

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

	override var intrinsicContentSize: CGSize {
		let componentsWidth = CGFloat(componentCount) * componentDimension
		let componentsSpacing = CGFloat(componentCount + 1) * 8
		let width = componentsWidth + componentsSpacing
		return CGSize(width: width, height: componentDimension)
	}
}
