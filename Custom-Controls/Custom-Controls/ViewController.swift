//
//  ViewController.swift
//  Custom-Controls
//
//  Created by Hector Steven on 5/14/19.
//  Copyright © 2019 Hector Steven. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
//	private func setTitle() {
//		let value = CustomControl().value
//		title = "User Rating: \(value) \(value == 1 ? "star" : "stars")"
//	}

	@IBAction func updateRating(_ ratingControl: CustomControl) {
		let value = ratingControl.value
		title = "User Rating: \(value) \(value == 1 ? "star" : "stars")"
	}
}

