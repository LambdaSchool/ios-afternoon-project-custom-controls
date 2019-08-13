//
//  ViewController.swift
//  StarRating
//
//  Created by Jeffrey Santana on 8/13/19.
//  Copyright © 2019 Lambda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	@IBAction func updateRating(_ sender: StarControl) {
		title = "User rating: \(sender.rating) \(sender.rating == 1 ? "star" : "stars")"
	}
	
}

