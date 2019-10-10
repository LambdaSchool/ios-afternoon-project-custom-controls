//
//  ViewController.swift
//  iOS-CustomControls
//
//  Created by Jonalynn Masters on 10/10/19.
//  Copyright © 2019 Jonalynn Masters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customControl: CustomControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: Actions
    // implement updateRating, set the view controllers title
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 1 {
            title = "User Rating: \(ratingControl.value) star"
        } else {
            title = "User Rating: \(ratingControl.value) stars"
        }
    }
}
