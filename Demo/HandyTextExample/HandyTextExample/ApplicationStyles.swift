//
//  ApplicationStyles.swift
//  TextStyleExample
//
//  Created by Aleksey on 04.07.16.
//  Copyright © 2016 Aleksey Chernish. All rights reserved.
//

import UIKit

extension TextStyle {
  
  static var plainText = TextStyle(font: .helvetica).dynamicFontStyle(.body)
  
  static var url: TextStyle {
    return plainText
      .foregroundColor(.blue)
      .italic()
      .underline(.single)
  }
  
  static var header: TextStyle {
    return plainText
      .sizeMultiplied(by: 1.4)
      .foregroundColor(.orange)
      .uppercase()
      .bold()
  }
  
  static var button: TextStyle {
    let shadow = NSShadow()
    shadow.shadowOffset = CGSize(width: 1.0, height: 1.0)
    shadow.shadowBlurRadius = 1.0
    shadow.shadowColor = UIColor.lightGray

    return header
      .foregroundColor(.black)
      .shadow(shadow)
  }

}

extension TagScheme {
  
  static var `default`: TagScheme {
    let scheme = TagScheme()
    scheme.forTag("b") { $0.bold() }
    scheme.forTag("i") { $0.italic().underline(.single) }
    scheme.forTag("u") { $0.uppercase() }
    
    return scheme
  }
  
}
