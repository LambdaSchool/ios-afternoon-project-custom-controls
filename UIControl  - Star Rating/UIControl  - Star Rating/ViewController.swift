//
//  ViewController.swift
//  UIControl  - Star Rating
//
//  Created by Mark Poggi on 4/16/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum rating: Int {
        case oneStar, twoStars, threeStars, fourStars, fiveStars
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
        
    }
    
    func updateViews() {
        self.title = "placeholder"
        
        
    }
    
    @IBAction func updateRating(_ ratingControl: CustomControl) {
        
    }
    
}

