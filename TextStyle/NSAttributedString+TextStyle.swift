//
//  NSAttributedString+TextStyle.swift
//  Styles
//
//  Created by aleksey on 24.06.16.
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

func +(left: NSAttributedString, right: NSAttributedString) -> NSAttributedString {
  let result = NSMutableAttributedString(attributedString: left)
  result.appendAttributedString(right)
  return result.copy() as! NSAttributedString
}

extension NSAttributedString {
  
  func applyStyle(style: TextStyle, toOccurencesOf substring: String) -> NSAttributedString {
    guard let range = rangeOf(substring) else { return self }
    let head = attributedSubstringFromRange(NSMakeRange(0, range.location))
    let foundString = attributedSubstringFromRange(range)
    let rest = attributedSubstringFromRange(NSMakeRange(range.length + range.location, self.length - (range.length + range.location)))
    
    return head + foundString.string.withStyle(style) + rest.applyStyle(style, toOccurencesOf: substring)
  }
  
  func applyStyle(style: TextStyle, in range: NSRange?) -> NSAttributedString {
    guard let range = range else { return self }
    let head = attributedSubstringFromRange(NSMakeRange(0, range.location))
    let substringInRange = attributedSubstringFromRange(range)
    let rest = attributedSubstringFromRange(NSMakeRange(range.length + range.location, self.length - (range.length + range.location)))
    
    return head + substringInRange.string.withStyle(style) + rest
  }
  
  func rangeOf(string: String) -> NSRange? {
    let aString = self.string as NSString
    let range = aString.rangeOfString(string)
    
    return range.location == NSNotFound ? nil : range
  }
  
}
