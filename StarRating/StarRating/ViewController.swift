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
        
        // Set the initial navbar title
       self.navigationItem.title = "Poo! There are no ratings yet! 😫"
    }

    // MARK: - Outlet
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        print("The ViewController rating received is: \(ratingControl.value)")
        if (ratingControl.value == -1 ){
            self.navigationItem.title = "Poo! There are no ratings yet! 😫"
        } else {
            // starWord Hehehe!
            let starWord: String = ratingControl.value > 1 ?  "stars" : "star"
            self.navigationItem.title = "User Rating: \(ratingControl.value+1) \(starWord)"
        }
    }
    
}

