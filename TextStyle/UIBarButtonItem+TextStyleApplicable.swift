//
//  UIBarButtonItem+TextStyleApplicable.swift
//  Reel
//
//  Created by Aleksey on 22.11.16.
//  Copyright © 2016 Yalantis. All rights reserved.
//

import UIKit

extension UIBarButtonItem: TextStyleApplicable {
  
  func applyAttributes(from style: TextStyle) {
    setTitleTextAttributes(style.textAttributes, for: .normal)
  }
  
}
