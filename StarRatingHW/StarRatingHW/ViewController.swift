//
//  ViewController.swift
//  StarRatingHW
//
//  Created by Michael Flowers on 5/14/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func updateRating(_ sender: CustomControl) { //this callback is a combination of an instance being called ("the target") and the method on the instance ("the action").
        if sender.value == 1 {
            title = "User Rating: \(sender.value) star!"
        } else if sender.value > 1 {
            title = "User Rating: \(sender.value) stars!"
        }
    }
    

}

