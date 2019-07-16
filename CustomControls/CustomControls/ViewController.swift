//
//  ViewController.swift
//  CustomControls
//
//  Created by Kat Milton on 7/16/19.
//  Copyright © 2019 Kat Milton. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func updateRating(_ sender: CustomControl) {
        switch sender.value {
            case 1:
                title = "User Rating: \(sender.value) star"
            default:
                title = "User Rating: \(sender.value) stars"
        }
        
    }
    
    
    


}

