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
		let value = 1
		title = "User Rating: \(value) star"
	}

	@IBAction func updateRating(_ ratingControl: CustomControl) {
		print("here")
		let value = ratingControl.value
		title = "User Rating: \(value) \(value == 1 ? "star" : "stars")"
	}
	
}

