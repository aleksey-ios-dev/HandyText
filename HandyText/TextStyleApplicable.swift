//
//  TextStyleApplicable.swift
//  HandyText
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

public protocol TextStyleApplicable {}

public extension TextStyleApplicable where Self: NSObject {
  
  func applyAttributes(from style: TextStyle) {
    let font = style.textAttributes[.font] as? UIFont
    let color = style.textAttributes[.foregroundColor] as? UIColor
    setValue(font, forKey: "font")
    setValue(color, forKey: "textColor")
  }
  
}

extension UILabel: TextStyleApplicable {}
extension UITextView: TextStyleApplicable {}
extension UITextField: TextStyleApplicable {}
