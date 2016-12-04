//
//  TagScheme.swift
//  HandyText
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import Foundation

typealias Tag = String
public typealias TextStyleModifier = (TextStyle) -> TextStyle

public class TagScheme {
  
  private var map = [Tag: TextStyleModifier]()
  
  public func forTag(_ tag: String, use modifier: @escaping TextStyleModifier) {
    map[tag] = modifier
  }
  
  func modifier(for tag: Tag) -> TextStyleModifier {
    return map[tag] ?? { $0 }
  }
  
}
