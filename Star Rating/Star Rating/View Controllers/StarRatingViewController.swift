//
//  StarRatingViewController.swift
//  Star Rating
//
//  Created by Michael on 1/23/20.
//  Copyright © 2020 Michael. All rights reserved.
//

import UIKit

class StarRatingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "User Rating: 1 star"
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        if ratingControl.value > 1 {
            title = "User Rating: \(ratingControl.value) stars"
        } else {
            title = "User Rating: \(ratingControl.value) star"
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

