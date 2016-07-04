//
//  UINavigationBar+TextStyle.swift
//  MVCDemo
//
//  Created by Aleksey on 28.06.16.
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import Foundation

extension UINavigationBar {
  
  func applyAttributesFrom(style: TextStyle) {
    titleTextAttributes = style.textAttributes
  }
  
}