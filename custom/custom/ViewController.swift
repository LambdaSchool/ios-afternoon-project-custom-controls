//
//  ViewController.swift
//  custom
//
//  Created by ronald huston jr on 7/5/20.
//  Copyright © 2020 HenryQuante. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //  this method allows the control's client [the VC] to receive updates about changes in the rating control
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        //  editing the method signature; no longer have to cast sender to the right class
        
        let rating = ratingControl.value
        let ratingX = (rating == 1) ? "star" : "stars"
        navigationItem.title = "User Rating: \(String(rating)) \(ratingX)"
    }
    
    
    
    //  target-action associates callbacks with an event.
    //  IB handles that by calling func addTarget(_ target: Any?, action: Selector,
    //  this callback is a combination of an instance being called (the 'target')
    //  and the method on the instance (the 'action')
}
