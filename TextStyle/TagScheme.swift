//
//  TagScheme.swift
//  TextStyleExample
//
//  Created by Aleksey on 21.08.16.
//  Copyright © 2016 Aleksey Chernish. All rights reserved.
//

import Foundation

typealias TextStyleModifier = TextStyle -> TextStyle
typealias Tag = String

class TagScheme {
  
  private var map = [Tag: TextStyleModifier]()
  
  func forTag(tag: Tag, use modifier: TextStyleModifier) {
    map[tag] = modifier
  }
  
  func modifierFor(tag: Tag) -> TextStyleModifier {
    if let modifier = map[tag] { return modifier }
    else { return { $0 } }
  }
  
}
