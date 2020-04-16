//
//  ViewController.swift
//  StarRating
//
//  Created by Hunter Oppel on 4/16/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let customControl = CustomControl()

    @IBAction func updateRating(_ sender: CustomControl) {
        title = "User Rating: \(customControl.value)"
        if customControl.value == 1 {
            title?.append(" star")
        } else {
            title?.append(" stars")
        }
    }
}

