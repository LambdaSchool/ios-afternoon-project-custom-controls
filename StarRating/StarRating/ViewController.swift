//
//  ViewController.swift
//  StarRating
//
//  Created by Hunter Oppel on 4/16/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func updateRating(_ sender: CustomControl) {
        title = "User Rating: \(sender.value) star"
        if sender.value != 1 {
            title?.append("s")
        }
    }
}

