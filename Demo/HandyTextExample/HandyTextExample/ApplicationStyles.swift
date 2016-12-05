//
//  ApplicationStyles.swift
//  TextStyleExample
//
//  Created by Aleksey on 04.07.16.
//  Copyright © 2016 Aleksey Chernish. All rights reserved.
//

import UIKit

extension TextStyle {
  
  static var plainText: TextStyle {
    return TextStyle(font: .Georgia).withSize(20)
  }
  
  static var url: TextStyle {
    return plainText.withForegroundColor(.blue).italic().withUnderline(.styleSingle)
  }
  
  static var header: TextStyle {
    return plainText.withSizeMultiplied(by: 1.4).withForegroundColor(.orange).uppercase().bold()
  }
  
  static var button: TextStyle {
    let shadow = NSShadow()
    shadow.shadowOffset = CGSize(width: 1, height: 1)
    shadow.shadowBlurRadius = 1
    shadow.shadowColor = UIColor.lightGray

    return header.withForegroundColor(.black).withShadow(shadow)
  }

}

extension TagScheme {
  
  static var `default`: TagScheme {
    let scheme = TagScheme()
    scheme.forTag("b") { $0.bold() }
    scheme.forTag("i") { $0.italic().withUnderline(.styleSingle) }
    scheme.forTag("u") { $0.uppercase() }
    
    return scheme
  }
  
}
