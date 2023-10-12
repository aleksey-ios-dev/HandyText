//
//  UINavigationBar+TextStyle.swift
//  HandyText
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

extension UINavigationBar: TextStyleApplicable {
  
  public func applyAttributes(from style: TextStyle) {
    titleTextAttributes = style.textAttributes
  }
  
}
