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
	let componentInactiveCOlor = UIColor.gray
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setup()
	}
	
	func setup() {
		for i in 1...componentCount {
			let label = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 40, height: 40)))
		}
	}
	
}
