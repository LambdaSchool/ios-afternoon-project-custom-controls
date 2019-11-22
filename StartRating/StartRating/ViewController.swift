//
//  ViewController.swift
//  StartRating
//
//  Created by Lambda_School_Loaner_201 on 11/21/19.
//  Copyright © 2019 Christian Lorenzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        switch ratingControl.value {
        case 1:
            self.title = "User Rating: \(ratingControl.value) star"
        default:
            self.title = "User Rating: \(ratingControl.value) stars"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

