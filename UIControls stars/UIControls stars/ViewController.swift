//
//  ViewController.swift
//  UIControls stars
//
//  Created by Bhawnish Kumar on 4/16/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateRating(_ ratingControl: StarControl) {
          let rating = ratingControl.value
          title = "User Rating: \(rating) stars"
      }

}

