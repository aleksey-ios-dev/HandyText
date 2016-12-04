//
//  Font.swift
//  TextStyle
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

struct Font {

  enum Thickness {
    case Extralight, Light, Regular, Medium, Bold, Heavy, Extraheavy
  }

  let extralight: String
  let extralightItalic: String
  let light: String
  let lightItalic: String
  let regular: String
  let italic: String
  let medium: String
  let mediumItalic: String
  let bold: String
  let boldItalic: String
  let heavy: String
  let heavyItalic: String
  let extraheavy: String
  let extraheavyItalic: String
		
  init(
    extralight: String = "",
    extralightItalic: String = "",
    light: String = "",
    lightItalic: String = "",
    regular: String = "",
    italic: String = "",
    medium: String = "",
    mediumItalic: String = "",
    bold: String = "",
    boldItalic: String = "",
    heavy: String = "",
    heavyItalic: String = "",
    extraheavy: String = "",
    extraheavyItalic: String = ""
    ) {
    self.extralight = extralight
    self.extralightItalic = extralightItalic
    self.light = light
    self.lightItalic = lightItalic
    self.regular = regular
    self.italic = italic
    self.medium = medium
    self.mediumItalic = mediumItalic
    self.bold = bold
    self.boldItalic = boldItalic
    self.heavy = heavy
    self.heavyItalic = heavyItalic
    self.extraheavy = extraheavy
    self.extraheavyItalic = extraheavyItalic
  }

}
