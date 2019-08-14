//
//  ViewController.swift
//  CustomControls
//
//  Created by Marlon Raskin on 8/13/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let layer = CAGradientLayer()

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(red: 0.04, green: 0.24, blue: 0.43, alpha: 1.00)]
		navigationController?.navigationBar.barTintColor = UIColor(red: 0.01, green: 1.00, blue: 0.79, alpha: 1.00)
		layer.colors = [UIColor(red: 0.01, green: 1.00, blue: 0.79, alpha: 1.00).cgColor,
						UIColor(red: 0.04, green: 0.24, blue: 0.43, alpha: 1.00).cgColor]
		layer.frame = view.bounds
		view.layer.insertSublayer(layer, at: 0)

	}

	@IBAction func updateRating(_ sender: CustomControl) {
		if sender.value == 1 {
			title = "User Rating: \(sender.value) star"
		} else {
			title = "User Rating: \(sender.value) stars"
		}
	}
}

