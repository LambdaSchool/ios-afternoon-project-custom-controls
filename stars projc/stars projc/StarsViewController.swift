//
//  StarsViewController.swift
//  stars projc
//
//  Created by Elizabeth Wingate on 2/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class StarsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
         title = "1 Star"
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        if ratingControl.value < 2 {
                 self.title = "\(ratingControl.value) star"
             } else {
                 self.title = "\(ratingControl.value) stars"
        }
    }
}
