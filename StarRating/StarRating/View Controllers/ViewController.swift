//
//  ViewController.swift
//  StarRating
//
//  Created by Lambda_School_Loaner_259 on 3/19/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if CustomControl.value == 1 {
            title = "User Rating: 1 star"
        } else {
            title = "User Rating: \(CustomControl.value) stars"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

