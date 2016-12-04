//
//  UIBarButtonItem+TextStyleApplicable.swift
//  HandyText
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

extension UIBarButtonItem: TextStyleApplicable {
  
  public func applyAttributes(from style: TextStyle) {
    setTitleTextAttributes(style.textAttributes, for: .normal)
  }
  
}
