//
//  Font.swift
//  HandyText
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

public struct Font {

  public enum Thickness {
    case extralight, light, regular, medium, semibold, bold, heavy, extraheavy
  }

  public let extralight: String
  public let extralightItalic: String
  public let light: String
  public let lightItalic: String
  public let regular: String
  public let italic: String
  public let medium: String
  public let mediumItalic: String
  public let semibold: String
  public let semiboldItalic: String
  public let bold: String
  public let boldItalic: String
  public let heavy: String
  public let heavyItalic: String
  public let extraheavy: String
  public let extraheavyItalic: String
		
  public init(
    extralight: String = "",
    extralightItalic: String = "",
    light: String = "",
    lightItalic: String = "",
    regular: String = "",
    italic: String = "",
    medium: String = "",
    mediumItalic: String = "",
    semibold: String = "",
    semiboldItalic: String = "",
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
    self.semibold = semibold
    self.semiboldItalic = semiboldItalic
    self.bold = bold
    self.boldItalic = boldItalic
    self.heavy = heavy
    self.heavyItalic = heavyItalic
    self.extraheavy = extraheavy
    self.extraheavyItalic = extraheavyItalic
  }

}
