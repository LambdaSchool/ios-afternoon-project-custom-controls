//
//  ViewController.swift
//  StarRatingCustomControls
//
//  Created by denis cedeno on 11/21/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func updateRating(_ ratingControl: CustomControl){
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

