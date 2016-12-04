//
//  TagScheme.swift
//  TextStyle
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import Foundation

typealias TextStyleModifier = (TextStyle) -> TextStyle
typealias Tag = String

class TagScheme {
  
  private var map = [Tag: TextStyleModifier]()
  
  func forTag(_ tag: Tag, use modifier: @escaping TextStyleModifier) {
    map[tag] = modifier
  }
  
  func modifier(for tag: Tag) -> TextStyleModifier {
    if let modifier = map[tag] { return modifier }
    else { return { $0 } }
  }
  
}
