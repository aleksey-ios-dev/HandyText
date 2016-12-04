//
//  UIBarButtonItem+TextStyleApplicable.swift
//  TextStyle
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

extension UIBarButtonItem: TextStyleApplicable {
  
  func applyAttributes(from style: TextStyle) {
    setTitleTextAttributes(style.textAttributes, for: .normal)
  }
  
}
