//
//  ViewController.swift
//  StarRating
//
//  Created by Rob Vance on 5/27/20.
//  Copyright © 2020 Robs Creations. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationTitle(value: 1)
    }
    
    

    // IBAction
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        navigationTitle(value: ratingControl.value)
    }
    
    
 
    
    
    func navigationTitle(value: Int) {
        if value == 1 {
            self.title = "User Rating: \(value) Star."
        } else {
            self.title = "User Rating: \(value) Stars"
        }
    }
}

