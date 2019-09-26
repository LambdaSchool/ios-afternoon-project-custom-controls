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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
        if ratingControl.value == 1 {
            self.title = "User Rating: 1 Star"
        } else {
            self.title = "User Rating: \(ratingControl.value) Stars"
        }
        
    }
    

}
