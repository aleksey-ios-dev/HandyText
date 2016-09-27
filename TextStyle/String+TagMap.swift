//
//  String+TagMap.swift
//  TextStyleExample
//
//  Created by Aleksey on 21.08.16.
//  Copyright © 2016 Aleksey Chernish. All rights reserved.
//

import Foundation

extension String {
  
  func withStyle(style: TextStyle, tagScheme: TagScheme) -> NSAttributedString {
    let result = NSMutableAttributedString()
    
    for (tag, substring) in decompose() {
      if let tag = tag, let substring = substring {
        result.appendAttributedString(substring.withStyle(tagScheme.modifier(for: tag)(style), tagScheme: tagScheme))
      } else if let substring = substring {
        result.appendAttributedString(substring.withStyle(style))
      }
    }
    
    return result
  }
  
  private func decompose() -> [(tag: Tag?, text: String?)] {
    if characters.isEmpty { return [] }
    
    let components = componentsSeparatedByString("<")
    if components.count == 1 {
      return [(nil, self)]
    } else {
      let tag = components[1].componentsSeparatedByString(">").first!
      let head = components[0]
      let body = componentsSeparatedByString("<\(tag)>")[1].componentsSeparatedByString("</\(tag)>").first
      let tail = substringFromIndex(rangeOfString("</\(tag)>")!.endIndex)
      
      var result = [(tag: Tag?, text: String?)]()
      result.append((nil, head))
      result.append((tag, body))
      result += tail.decompose()
      
      return result
    }
  }
  
}
