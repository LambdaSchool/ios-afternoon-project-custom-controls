//
//  ViewController.swift
//  StarRating
//
//  Created by Chris Dobek on 4/16/20.
//  Copyright © 2020 Chris Dobek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func updateRating(_ ratingControl: CustomControl) {
            self.title = "User Rating: \(ratingControl.value) star(s)"
        }
}


