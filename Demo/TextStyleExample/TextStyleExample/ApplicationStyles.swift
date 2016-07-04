//
//  ApplicationStyles.swift
//  TextStyleExample
//
//  Created by Aleksey on 04.07.16.
//  Copyright © 2016 Aleksey Chernish. All rights reserved.
//

import Foundation

extension TextStyle {
  
  static var plainText: TextStyle {
    return TextStyle(font: .Avenir)
  }
  
  static var url: TextStyle {
    return plainText.withForegroundColor(.blueColor()).italic().withUnderline(.StyleSingle)
  }
  
  static var header: TextStyle {
    return plainText.withSizeMultipliedBy(1.4).withForegroundColor(.orangeColor()).uppercase().bold()
  }
  
}