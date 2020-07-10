//
//  TextStyleApplicable.swift
//  HandyText
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

public protocol TextStyleApplicable {
  
  func setText(_ text: String, with style: TextStyle)
  
}

public extension TextStyleApplicable where Self: NSObject {
  
  
  func applyAttributes(from style: TextStyle) {
    let font = style.textAttributes[.font] as? UIFont
    let color = style.textAttributes[.foregroundColor] as? UIColor
    setValue(font, forKey: "font")
    setValue(color, forKey: "textColor")
  }
  
  func setText(_ text: String, with style: TextStyle) {
    fatalError("Not implemented for this class. Use -applyAttributes")
  }
  
}

extension UILabel: TextStyleApplicable {
  public func setText(_ text: String, with style: TextStyle) {
    attributedText = text.withStyle(style)
  }
}

extension UITextView: TextStyleApplicable {
  public func setText(_ text: String, with style: TextStyle) {
    attributedText = text.withStyle(style)
  }
}

extension UITextField: TextStyleApplicable {
  public func setText(_ text: String, with style: TextStyle) {
    attributedText = text.withStyle(style)
  }
}
