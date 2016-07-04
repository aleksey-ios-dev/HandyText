//
//  String+TextStyle.swift
//  Styles
//
//  Created by aleksey on 24.06.16.
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

extension String {
  
  func withStyle(style: TextStyle) -> NSAttributedString {
    var string: String
    
    switch style.caseTrait {
    case .Capitalized:
      string = self.capitalizedString
    case .Lowercase:
      string = self.lowercaseString
    case .Uppercase:
      string = self.uppercaseString
    case .Normal:
      string = self
    }
    
    return NSAttributedString(string: string, attributes: style.textAttributes)
  }

}