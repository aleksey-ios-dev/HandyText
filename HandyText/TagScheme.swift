//
//  TagScheme.swift
//  HandyText
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import Foundation

public typealias TextStyleModifier = (TextStyle) -> TextStyle

public class TagScheme {
  
  private var map = [String: TextStyleModifier]()
  
  public init(decorator: (TagScheme) -> Void) {
    decorator(self)
  }
  
  public func tag(_ tag: String, use modifier: @escaping TextStyleModifier) {
    map[tag] = modifier
  }
  
  func modifier(for tag: String) -> TextStyleModifier {
    map[tag] ?? { $0 }
  }
  
}
