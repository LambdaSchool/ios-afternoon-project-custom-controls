//
//  ViewController.swift
//  CustomControls
//
//  Created by Joseph Rogers on 11/21/19.
//  Copyright © 2019 Joseph Rogers. All rights reserved.
//

import UIKit
@IBDesignable
class ViewController: UIViewController {
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User Rating: 0 stars"
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
      switch ratingControl.value {
          case 1:
            self.title = "User Rating: \(ratingControl.value) star"
          default:
            self.title = "User Rating: \(ratingControl.value) stars"
          }
        }
}

