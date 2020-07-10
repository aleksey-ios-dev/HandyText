//
//  TextStyle+Modifiers.swift
//  HandyText
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

extension TextStyle {
  
  //MARK: - Based on
  
  public static func based(on style: TextStyle) -> TextStyle {
    return style.copy()
  }
  
  //MARK: - Fill color
  
  public func foregroundColor(_ color: UIColor) -> TextStyle {
    var copy = self.copy()
    copy.foregroundColor = color
    return copy
  }
  
  public func backgroundColor(_ color: UIColor) -> TextStyle {
    var copy = self.copy()
    copy.backgroundColor = color
    return copy
  }
  
  //MARK: - Size
  
  public func size(_ size: CGFloat) -> TextStyle {
    var copy = self.copy()
    copy.size = size
    return copy
  }
  
  public func sizeIncremented(by increment: CGFloat) -> TextStyle {
    var copy = self.copy()
    copy.size += increment
    return copy
  }
  
  public func sizeMultiplied(by multiplier: CGFloat) -> TextStyle {
    var copy = self.copy()
    copy.size *= multiplier
    return copy
  }
  
  public func dynamicFontStyle(_ style: DynamicFontStyle) -> TextStyle {
    var copy = self.copy()
    copy.size = UIFont.preferredFont(forTextStyle: UIFont.TextStyle(rawValue: style.literal)).pointSize
    return copy
  }
  
  //MARK: - Thickness

  public func extralight() -> TextStyle {
    var copy = self.copy()
    copy.thickness = .extralight
    return copy
  }
  
  public func light() -> TextStyle {
    var copy = self.copy()
    copy.thickness = .light
    return copy
  }
  
  public func regular() -> TextStyle {
    var copy = self.copy()
    copy.thickness = .regular
    return copy
  }
  
  public func medium() -> TextStyle {
    var copy = self.copy()
    copy.thickness = .medium
    return copy
  }
  
  public func bold() -> TextStyle {
    var copy = self.copy()
    copy.thickness = .bold
    return copy
  }
  
  public func heavy() -> TextStyle {
    var copy = self.copy()
    copy.thickness = .heavy
    return copy
  }
  
  public func extraheavy() -> TextStyle {
    var copy = self.copy()
    copy.thickness = .extraheavy
    return copy
  }
  
  //MARK: - Slant
  
  public func italic() -> TextStyle {
    var copy = self.copy()
    copy.isItalic = true
    return copy
  }
  
  public func roman() -> TextStyle {
    var copy = self.copy()
    copy.isItalic = false
    return copy
  }
  
  //MARK: - Case Trait, mutually exclusive
  
  public func capitalized() -> TextStyle {
    var copy = self.copy()
    copy.caseTrait = .capitalized
    return copy
  }
  
  public func lowercase() -> TextStyle {
    var copy = self.copy()
    copy.caseTrait = .lowercase
    return copy
  }
  
  public func uppercase() -> TextStyle {
    var copy = self.copy()
    copy.caseTrait = .uppercase
    return copy
  }
  
  //MARK: - Underline
  
  public func underline(_ style: NSUnderlineStyle) -> TextStyle {
    var copy = self.copy()
    copy.underlineStyle = style
    return copy
  }
  
  public func underlineColor(_ color: UIColor?) -> TextStyle {
    var copy = self.copy()
    copy.underlineColor = color
    return copy
  }
  
  //MARK: - Strikethrough
  
  public func strikethrough(_ strikethrough: Bool) -> TextStyle {
    var copy = self.copy()
    copy.strikethrough = strikethrough
    return copy
  }
  
  public func strikethroughColor(_ color: UIColor?) -> TextStyle {
    var copy = self.copy()
    copy.strikeThroughColor = color
    return copy
  }
  
  //MARK: - Ligatures
  
  public func ligaturesEnabled(_ enabled: Bool) -> TextStyle {
    var copy = self.copy()
    copy.ligaturesEnabled = enabled
    return copy
  }
  
  //MARK: - Stroke
  
  public func strokeWidth(_ width: CGFloat) -> TextStyle {
    var copy = self.copy()
    copy.strokeWidth = width
    return copy
  }

  public func strokeColor(_ color: UIColor?) -> TextStyle {
    var copy = self.copy()
    copy.strokeColor = color
    return copy
  }
  
  //MARK: - Shadow
  
  public func shadow(_ shadow: NSShadow?) -> TextStyle {
    var copy = self.copy()
    copy.shadow = shadow
    return copy
  }
  
  // MARK: - Opacity
  
  public func opacity(_ opacity: CGFloat) -> TextStyle {
    var copy = self.copy()
    copy.opacity = opacity
    return copy
  }
  
  //MARK: - Link 
  
  public func link(_ link: String?) -> TextStyle {
    var copy = self.copy()
    copy.link = link
    return copy
  }
  
  //MARK: - Offset
  
  public func baselineOffset(absolute offset: CGFloat) -> TextStyle {
    var copy = self.copy()
    copy.baselineOffset = .absolute(offset)
    return copy
  }
  
  func baselineOffset(relative ratio: CGFloat) -> TextStyle {
    var copy = self.copy()
    copy.baselineOffset = .relative(ratio)
    return copy
  }
  
  //MARK: - Paragraph style options
  
  public func paragraphStyle(_ style: NSParagraphStyle) -> TextStyle {
    var copy = self.copy()
    copy.paragraphStyle = style.mutableCopy() as! NSMutableParagraphStyle
    return copy
  }
  
  public func lineBreakMode(_ mode: NSLineBreakMode) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.lineBreakMode = mode
    return copy
  }
  
  public func headIndent(_ indent: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.headIndent = indent
    return copy
  }
  
  public func firstLineIndent(_ indent: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.firstLineHeadIndent = indent
    return copy
  }
  
  public func paragraphSpacing(_ spacing: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.paragraphSpacing = spacing
    return copy
  }

  public func paragraphSpacingBefore(_ spacing: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.paragraphSpacingBefore = spacing
    return copy
  }

  public func alignment(_ alignment: NSTextAlignment) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.alignment = alignment
    return copy
  }
  
  public func lineSpacing(_ spacing: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.lineSpacing = spacing
    return copy
  }
  
  // MARK: - Letter spacing
  
  public func letterSpacing(_ spacing: CGFloat) -> TextStyle {
    var copy = self.copy()
    copy.letterSpacing = spacing
    return copy
  }
  
  // MARK: - Tag scheme
  
  public func tagScheme(_ scheme: TagScheme) -> TextStyle {
    var copy = self.copy()
    copy.tagScheme = scheme
    return copy
  }
  

}
