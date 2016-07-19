//
//  TextStyleApplicable.swift
//  MVCDemo
//
//  Created by aleksey on 26.06.16.
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

protocol TextStyleApplicable {}

extension TextStyleApplicable where Self: NSObject {
  
  func applyAttributesFrom(style: TextStyle) {
    let font = style.textAttributes[NSFontAttributeName] as? UIFont
    let color = style.textAttributes[NSForegroundColorAttributeName] as? UIColor
    setValue(font, forKey: "font")
    setValue(color, forKey: "textColor")
  }
  
}

extension UILabel: TextStyleApplicable {}
extension UITextView: TextStyleApplicable {}
extension UITextField: TextStyleApplicable {}
