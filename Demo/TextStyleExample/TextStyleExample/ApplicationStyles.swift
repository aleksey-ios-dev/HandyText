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
    return TextStyle(font: .Avenir)
  }
  
  static func url(link: String) -> TextStyle {
    return plainText.withForegroundColor(.blueColor()).italic().withUnderline(.StyleSingle).withLink(link)
  }
  
  static var header1: TextStyle {
    return plainText.withSizeMultipliedBy(1.4).withForegroundColor(.orangeColor()).uppercase().bold()
  }
  
  static var header2: TextStyle {
    return header1.withSizeMultipliedBy(1.2).withForegroundColor(.orangeColor())
  }
  
  static var button: TextStyle {
    let shadow = NSShadow()
    shadow.shadowOffset = CGSize(width: 1, height: 1)
    shadow.shadowBlurRadius = 1
    shadow.shadowColor = UIColor.lightGrayColor()

    return header.withForegroundColor(.blackColor()).withShadow(shadow)
  }

}