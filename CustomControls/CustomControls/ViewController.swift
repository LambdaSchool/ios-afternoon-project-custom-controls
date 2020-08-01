//
//  ViewController.swift
//  CustomControls
//
//  Created by Cora Jacobson on 7/30/20.
//  Copyright © 2020 Cora Jacobson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        var title = "User Rating: \(ratingControl.value) Star"
        if ratingControl.value > 1 {
            title.append("s")
        }
        self.navigationItem.title = title
    }
    
}
