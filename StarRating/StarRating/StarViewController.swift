//
//  StarViewController.swift
//  StarRating
//
//  Created by Bobby Keffury on 9/26/19.
//  Copyright © 2019 Bobby Keffury. All rights reserved.
//

import UIKit

class StarViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    


    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        if ratingControl.value == 1 {
            self.title = "User Rating: 1 Star"
            view.backgroundColor = UIColor.red
        } else if ratingControl.value == 2 {
            self.title = "User Rating: 2 Stars"
            view.backgroundColor = UIColor.systemRed
        } else if ratingControl.value == 3 {
            self.title = "User Rating: 3 Stars"
            view.backgroundColor = UIColor.lightGray
        } else if ratingControl.value == 4 {
            self.title = "User Rating: 4 Stars"
            view.backgroundColor = UIColor.systemGreen
        } else if ratingControl.value == 5 {
            self.title = "User Rating: 5 Stars"
            view.backgroundColor = UIColor.green
        }
        
       
        
    }
    

}
