//
//  uiview+ext.swift
//  Custom-Controls
//
//  Created by Hector Steven on 5/14/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

extension UIView {
	
	func performFlare() {
		func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
		func unflare() { transform = .identity }
		
		UIView.animate(withDuration: 0.3,
					   animations: { flare() },
					   completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
	}
}
