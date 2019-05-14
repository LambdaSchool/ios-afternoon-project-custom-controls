//
//  ViewController.swift
//  StarRating
//
//  Created by Sameera Roussi on 5/14/19.
//  Copyright © 2019 Sameera Roussi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // MARK: - Outlet
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value == 0 {
            self.navigationItem.title = "There are no user ratings, sorry"
        } else {
            // starWord Hehehe!
            let starWord: String = ratingControl.value > 1 ?  "stars" : "star"
            self.navigationItem.title = "User Rating: \(ratingControl.value) \(starWord)"
        }
    }
    
}

