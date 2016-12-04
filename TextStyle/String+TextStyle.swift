//
//  String+TextStyle.swift
//  TextStyle
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

extension String {
  
  func withStyle(_ style: TextStyle) -> NSAttributedString {
    var string: String
    
    switch style.caseTrait {
    case .Capitalized:
      string = self.capitalized
    case .Lowercase:
      string = self.lowercased()
    case .Uppercase:
      string = self.uppercased()
    case .Normal:
      string = self
    }
    
    return NSAttributedString(string: string, attributes: style.textAttributes)
  }

}
