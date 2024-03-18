//
//  String+TextStyle.swift
//  HandyText
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

extension String {
  
  public func withStyle(_ style: TextStyle) -> NSAttributedString {
    var string: String
    
    switch style.caseTrait {
    case .capitalized:
      string = self.capitalized
    case .lowercase:
      string = self.lowercased()
    case .uppercase:
      string = self.uppercased()
    case .none:
      string = self
    }
    
    return NSAttributedString(string: string, attributes: style.textAttributes)
  }

}
