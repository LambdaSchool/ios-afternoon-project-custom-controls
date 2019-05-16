//
//  ViewController.swift
//  Star Rating
//
//  Created by Michael Redig on 5/14/19.
//  Copyright © 2019 Red_Egg Productions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet var starControl: StarControl!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		updateRating(starControl)
		starControl.tintColor = .green
		starControl.maxValue = 6
	}

	@IBAction func updateRating(_ sender: StarControl) {
		navigationItem.title = sender.value == 1 ? "User Rating: \(sender.value) star" : "User Rating: \(sender.value) stars"
	}

}
