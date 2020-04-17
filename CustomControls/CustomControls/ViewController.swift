//
//  ViewController.swift
//  CustomControls
//
//  Created by Cameron Collins on 4/16/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //Actions
    @IBAction func updateRating(_ sender: CustomControl) {
        if customControl.value > 0 {
            title = "User Rating: \(customControl.value) stars"
        } else {
            title = "User Rating: \(customControl.value) star"
        }
    }
    
    //Variables
    var customControl = CustomControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

