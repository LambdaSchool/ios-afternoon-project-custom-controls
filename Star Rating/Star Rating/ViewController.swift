//
//  ViewController.swift
//  Star Rating
//
//  Created by Zack Larsen on 12/12/19.
//  Copyright © 2019 Zack Larsen. All rights reserved.
//

import UIKit
@IBDesignable
class ViewController: UIViewController {
    

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        self.title = "UserRaiting: \(ratingControl.value) stars"

        
    }

}

