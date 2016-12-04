//
//  UINavigationBar+TextStyle.swift
//  TextStyle
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

extension UINavigationBar: TextStyleApplicable {
  
  func applyAttributesFrom(_ style: TextStyle) {
    titleTextAttributes = style.textAttributes
  }
  
}
