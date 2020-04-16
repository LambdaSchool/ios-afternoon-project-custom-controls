//
//  UIView+Extension.swift
//  StarRating
//
//  Created by Hunter Oppel on 4/16/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  // "Flare view" animation sequence
  func performFlare() {
    func flare()   { transform = CGAffineTransform(scaleX: 1.6, y: 1.6) }
    func unflare() { transform = .identity }
    
    UIView.animate(withDuration: 0.3,
                   animations: { flare() },
                   completion: { _ in UIView.animate(withDuration: 0.1) { unflare() }})
  }
}
