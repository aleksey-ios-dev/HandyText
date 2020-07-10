//
//  String+TextStyle.swift
//  HandyText
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import Foundation

extension String {
  
   public func withStyle(_ style: TextStyle) -> NSAttributedString {
    guard let tagScheme = style.tagScheme else {
      return makeAttributed(with: style)
    }
    
    let result = NSMutableAttributedString()
    
    for (tag, substring) in decompose() {
      if let tag = tag, let substring = substring {
        result.append(substring.withStyle(tagScheme.modifier(for: tag)(style)))
      } else if let substring = substring {
        result.append(substring.makeAttributed(with: style))
      }
    }
    
    return result
  }
  
  private func decompose() -> [(tag: String?, text: String?)] {
    if isEmpty { return [] }
    
    let components = self.components(separatedBy: "<")
    if components.count == 1 {
      return [(nil, self)]
    } else {
      let tag = components[1].components(separatedBy: ">").first!
      let head = components[0]
      let body = self.components(separatedBy: "<\(tag)>")[1].components(separatedBy: "</\(tag)>").first
      let tail = String(suffix(from: range(of: "</\(tag)>")!.upperBound))
      var result = [(tag: String?, text: String?)]()
      result.append((nil, head))
      result.append((tag, body))
      result += tail.decompose()
      
      return result
    }
  }
  
}

private extension String {
  
  func makeAttributed(with style: TextStyle) -> NSAttributedString {
    var string: String
    
    switch style.caseTrait {
    case .capitalized: string = capitalized
    case .lowercase: string = lowercased()
    case .uppercase: string = uppercased()
    case .none: string = self
    }
    
    return NSAttributedString(string: string,
                              attributes: style.textAttributes)
  }

}

