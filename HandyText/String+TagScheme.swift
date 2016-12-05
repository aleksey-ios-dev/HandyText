//
//  String+TagScheme.swift
//  HandyText
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import Foundation

extension String {
  
   public func withStyle(_ style: TextStyle, tagScheme: TagScheme) -> NSAttributedString {
    let result = NSMutableAttributedString()
    
    for (tag, substring) in decompose() {
      if let tag = tag, let substring = substring {
        result.append(substring.withStyle(tagScheme.modifier(for: tag)(style), tagScheme: tagScheme))
      } else if let substring = substring {
        result.append(substring.withStyle(style))
      }
    }
    
    return result
  }
  
  private func decompose() -> [(tag: String?, text: String?)] {
    if characters.isEmpty { return [] }
    
    let components = self.components(separatedBy: "<")
    if components.count == 1 {
      return [(nil, self)]
    } else {
      let tag = components[1].components(separatedBy: ">").first!
      let head = components[0]
      let body = self.components(separatedBy: "<\(tag)>")[1].components(separatedBy: "</\(tag)>").first
      let tail = substring(from: range(of: "</\(tag)>")!.upperBound)
      
      var result = [(tag: String?, text: String?)]()
      result.append((nil, head))
      result.append((tag, body))
      result += tail.decompose()
      
      return result
    }
  }
  
}
