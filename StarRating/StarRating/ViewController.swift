//
//  ViewController.swift
//  StarRating
//
//  Created by Keri Levesque on 2/20/20.
//  Copyright © 2020 Keri Levesque. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    // MARK: Properties
    let customControl = CustomControl()
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateRating(customControl)
     }

//MARK: Actions
    //  will say star instead of stars for only one star rating
    @IBAction func updateRating(_ ratingControl: CustomControl) {
                switch ratingControl.value {
           case 1: navigationItem.title = "User Rating: \(ratingControl.value) star"
           default: navigationItem.title = "User Rating: \(ratingControl.value) stars"
           }
      }
}

