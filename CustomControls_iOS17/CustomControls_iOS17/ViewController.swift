//
//  ViewController.swift
//  CustomControls_iOS17
//
//  Created by Stephanie Ballard on 5/14/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var customControl = CustomControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitle()
        
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        navigationTitle()
    }
    
    func navigationTitle() {
        if customControl.value == 1 {
            self.title = "User Rating: \(customControl.value) Star."
        } else {
            self.title = "User Rating: \(customControl.value) Stars."
        }
    }
}

