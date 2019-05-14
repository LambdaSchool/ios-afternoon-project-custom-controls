//
//  CustomControl.swift
//  Custom-Controls
//
//  Created by Hector Steven on 5/14/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
	var value = 1
	private let componentDimension: CGFloat = 40.0
	private let componentCount = 5
	private let componentActiveColor = UIColor.black
	private let componentInactiveColor = UIColor.gray
	
	required init?(coder aCoder: NSCoder) {
		super.init(coder: aCoder)
		setup()
	}
	
	
	private func setup() {
		var labels: [UILabel] = []
		
		for i in 1...5 {
			let label = UILabel()
			label.tag = i
			labels.append(label)
		}
		
		labels.forEach( { addSubview( $0 )} )
		print(labels.count)
	}
	
	override func draw(_ rect: CGRect) {
		
    }
	

}
