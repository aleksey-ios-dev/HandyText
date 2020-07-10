//
//  TextStyle+Modifiers.swift
//  HandyText
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

extension TextStyle {
  
  //MARK: - Based on
  
  public static func based(on style: TextStyle,
                           modifier: ((inout TextStyle) -> Void)? = nil) -> TextStyle {
    var copy = style.copy()
    modifier?(&copy)
    return copy
  }
  
  //MARK: - Fill color
  
  public func foregroundColor(_ color: UIColor) -> TextStyle {
    return .based(on: self) { $0.foregroundColor = color }
  }
  
  public func backgroundColor(_ color: UIColor) -> TextStyle {
    return .based(on: self) { $0.backgroundColor = color }
  }
  
  //MARK: - Size
  
  public func size(_ size: CGFloat) -> TextStyle {
    return .based(on: self) { $0.size = size }
  }
  
  public func sizeIncremented(by increment: CGFloat) -> TextStyle {
    return .based(on: self) { $0.size += increment }
  }
  
  public func sizeMultiplied(by multiplier: CGFloat) -> TextStyle {
    return .based(on: self) { $0.size *= multiplier }
  }
  
  public func dynamicFontStyle(_ style: DynamicFontStyle) -> TextStyle {
    return .based(on: self) { $0.size = UIFont.preferredFont(forTextStyle: UIFont.TextStyle(rawValue: style.literal)).pointSize }
  }
  
  //MARK: - Thickness
  
  public func extralight() -> TextStyle {
    return .based(on: self) { $0.thickness = .extralight }
  }
  
  public func light() -> TextStyle {
    return .based(on: self) { $0.thickness = .light }
  }
  
  public func regular() -> TextStyle {
    return .based(on: self) { $0.thickness = .regular }
  }
  
  public func medium() -> TextStyle {
    return .based(on: self) { $0.thickness = .medium }
  }
  
  public func bold() -> TextStyle {
    return .based(on: self) { $0.thickness = .bold }
  }
  
  public func heavy() -> TextStyle {
    return .based(on: self) { $0.thickness = .heavy }
  }
  
  public func extraheavy() -> TextStyle {
    return .based(on: self) { $0.thickness = .extraheavy }
  }
  
  //MARK: - Slant
  
  public func italic() -> TextStyle {
    return .based(on: self) { $0.isItalic = true }
  }
  
  public func roman() -> TextStyle {
    return .based(on: self) { $0.isItalic = false }
  }
  
  //MARK: - Case Trait, mutually exclusive
  
  public func capitalized() -> TextStyle {
    return .based(on: self) { $0.caseTrait = .capitalized }
  }
  
  public func lowercase() -> TextStyle {
    return .based(on: self) { $0.caseTrait = .lowercase }
  }
  
  public func uppercase() -> TextStyle {
    return .based(on: self) { $0.caseTrait = .uppercase }
  }
  
  //MARK: - Underline
  
  public func underline(_ style: NSUnderlineStyle) -> TextStyle {
    return .based(on: self) { $0.underlineStyle = style }
  }
  
  public func underlineColor(_ color: UIColor?) -> TextStyle {
    return .based(on: self) { $0.underlineColor = color }
  }
  
  //MARK: - Strikethrough
  
  public func strikethrough(_ strikethrough: Bool) -> TextStyle {
    return .based(on: self) { $0.strikethrough = strikethrough }
  }
  
  public func strikethroughColor(_ color: UIColor?) -> TextStyle {
    return .based(on: self) { $0.strikeThroughColor = color }
  }
  
  //MARK: - Ligatures
  
  public func ligaturesEnabled(_ enabled: Bool) -> TextStyle {
    return .based(on: self) { $0.ligaturesEnabled = enabled }
  }
  
  //MARK: - Stroke
  
  public func strokeWidth(_ width: CGFloat) -> TextStyle {
    return .based(on: self) { $0.strokeWidth = width }
  }
  
  public func strokeColor(_ color: UIColor?) -> TextStyle {
    return .based(on: self) { $0.strokeColor = color }
  }
  
  //MARK: - Shadow
  
  public func shadow(_ shadow: NSShadow?) -> TextStyle {
    return .based(on: self) { $0.shadow = shadow }
  }
  
  // MARK: - Opacity
  
  public func opacity(_ opacity: CGFloat) -> TextStyle {
    return .based(on: self) { $0.opacity = opacity }
  }
  
  //MARK: - Link 
  
  public func link(_ link: String?) -> TextStyle {
    return .based(on: self) { $0.link = link }
  }
  
  //MARK: - Offset
  
  public func baselineOffset(absolute offset: CGFloat) -> TextStyle {
    return .based(on: self) { $0.baselineOffset = .absolute(offset) }
  }
  
  func baselineOffset(relative ratio: CGFloat) -> TextStyle {
    return .based(on: self) { $0.baselineOffset = .relative(ratio) }
  }
  
  //MARK: - Paragraph style options
  
  public func paragraphStyle(_ style: NSParagraphStyle) -> TextStyle {
    return .based(on: self) { $0.paragraphStyle = style.mutableCopy() as! NSMutableParagraphStyle }
  }
  
  public func lineBreakMode(_ mode: NSLineBreakMode) -> TextStyle {
    return .based(on: self) { $0.paragraphStyle.lineBreakMode = mode }
  }
  
  public func headIndent(_ indent: CGFloat) -> TextStyle {
    return .based(on: self) { $0.paragraphStyle.headIndent = indent }
  }
  
  public func firstLineIndent(_ indent: CGFloat) -> TextStyle {
    return .based(on: self) { $0.paragraphStyle.firstLineHeadIndent = indent }
  }
  
  public func paragraphSpacing(_ spacing: CGFloat) -> TextStyle {
    return .based(on: self) { $0.paragraphStyle.paragraphSpacing = spacing }
  }
  
  public func paragraphSpacingBefore(_ spacing: CGFloat) -> TextStyle {
    return .based(on: self) { $0.paragraphStyle.paragraphSpacingBefore = spacing }
  }
  
  public func alignment(_ alignment: NSTextAlignment) -> TextStyle {
    return .based(on: self) { $0.paragraphStyle.alignment = alignment }
  }
  
  public func lineSpacing(_ spacing: CGFloat) -> TextStyle {
    return .based(on: self) { $0.paragraphStyle.lineSpacing = spacing }
  }
  
  // MARK: - Letter spacing
  
  public func letterSpacing(_ spacing: CGFloat) -> TextStyle {
    return .based(on: self) { $0.letterSpacing = spacing }
  }
  
  // MARK: - Tag scheme
  
  public func tagScheme(_ scheme: TagScheme) -> TextStyle {
    return .based(on: self) { $0.tagScheme = scheme }
  }
  
}
