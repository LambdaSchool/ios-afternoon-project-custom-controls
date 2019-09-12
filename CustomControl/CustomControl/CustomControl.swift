//
//  CustomControl.swift
//  CustomControl
//
//  Created by Taylor Lyles on 9/12/19.
//  Copyright © 2019 Taylor Lyles. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
	
	var value: Int = 1
	let componentDimension: CGFloat = 40.0
	let componentCount = 5
	let componentActiveColor = UIColor.black
	let componentInactiveColor = UIColor.gray
	var labels = [UILabel]()
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
	
	func setup() {
		for i in 1...componentCount {
			let label = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
			
			label.tag = i
			label.text = "☆"
			label.textAlignment = .center
			label.textColor = componentInactiveColor
			label.font = UIFont(name: label.font.fontName, size: 32)
			
			labels.append(label)
			addSubview(label)
		}
	}
	
	override var intrinsicContentSize: CGSize {
		let componentsWidth = CGFloat(componentCount) * componentDimension
		let componentsSpacing = CGFloat(componentCount + 1) * 8.0
		let width = componentsWidth + componentsSpacing
		return CGSize(width: width, height: componentDimension)
	}
}
