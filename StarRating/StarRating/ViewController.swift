//
//  ViewController.swift
//  StarRating
//
//  Created by Karen Rodriguez on 3/19/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customControl: CustomControl!
    
    private let changeDirection = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User Rating: 1 star."
        setUpButton()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
        self.title = ratingControl.value == 1 ? "User Rating: \(ratingControl.value) star" : "User Rating: \(ratingControl.value) stars"
        
    }
    
    private func setUpButton() {
        changeDirection.translatesAutoresizingMaskIntoConstraints = false
        changeDirection.setTitle("Change direction.", for: .normal)
        changeDirection.setTitleColor(.black, for: .normal)
        view.addSubview(changeDirection)
        
        NSLayoutConstraint.activate([
            changeDirection.leadingAnchor.constraint(equalTo: customControl.leadingAnchor),
            changeDirection.trailingAnchor.constraint(equalTo: customControl.trailingAnchor),
            changeDirection.topAnchor.constraint(equalTo: customControl.bottomAnchor, constant: 20)
        ])
        
        changeDirection.addTarget(self, action: #selector(toggleDirection), for: .touchUpInside)
    }
    
    @objc private func toggleDirection() {
        customControl.rightToLeft.toggle()
    }
    
}


