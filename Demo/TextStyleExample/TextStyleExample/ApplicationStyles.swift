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
    return plainText.withForegroundColor(.blueColor()).italic().withUnderline(.StyleSingle)
  }
  
  static var header: TextStyle {
    return plainText.withSizeMultipliedBy(1.4).withForegroundColor(.orangeColor()).uppercase().bold()
  }
  
  static var button: TextStyle {
    let shadow = NSShadow()
    shadow.shadowOffset = CGSize(width: 1, height: 1)
    shadow.shadowBlurRadius = 1
    shadow.shadowColor = UIColor.lightGrayColor()

    return header.withForegroundColor(.blackColor()).withShadow(shadow)
  }

}

extension TagScheme {
  
  static var `default`: TagScheme {
    let scheme = TagScheme()
    scheme.forTag("b") { $0.bold() }
    scheme.forTag("i") { $0.italic().withUnderline(.StyleSingle) }
    scheme.forTag("u") { $0.uppercase() }
    
    return scheme
  }
  
}
