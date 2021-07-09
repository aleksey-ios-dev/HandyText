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
    copy(with: \.foregroundColor, setTo: color)
  }
  
  public func backgroundColor(_ color: UIColor) -> TextStyle {
    copy(with: \.backgroundColor, setTo: color)
  }
  
  //MARK: - Size
  
  public func size(_ size: CGFloat) -> TextStyle {
    copy(with: \.size, setTo: size)
  }
  
  public func sizeIncremented(by increment: CGFloat) -> TextStyle {
    copy(with: \.size, setTo: size + increment)
  }
  
  public func sizeMultiplied(by multiplier: CGFloat) -> TextStyle {
    copy(with: \.size, setTo: size * multiplier)
  }
  
  public func dynamicFontStyle(_ style: DynamicFontStyle) -> TextStyle {
    copy(with: \.size, setTo:  UIFont.preferredFont(forTextStyle: UIFont.TextStyle(rawValue: style.literal)).pointSize)
  }
  
  //MARK: - Thickness
  
  public func extralight() -> TextStyle {
    copy(with: \.thickness, setTo: .extralight)
  }
  
  public func light() -> TextStyle {
    copy(with: \.thickness, setTo: .light)
  }
  
  public func regular() -> TextStyle {
    copy(with: \.thickness, setTo: .regular)
  }
  
  public func medium() -> TextStyle {
    copy(with: \.thickness, setTo: .medium)
  }
  
  public func semibold() -> TextStyle {
    copy(with: \.thickness, setTo: .semibold)
  }
  
  public func bold() -> TextStyle {
    copy(with: \.thickness, setTo: .bold)
  }
  
  public func heavy() -> TextStyle {
    copy(with: \.thickness, setTo: .heavy)
  }
  
  public func extraheavy() -> TextStyle {
    copy(with: \.thickness, setTo: .extraheavy)
  }
  
  //MARK: - Slant
  
  public func italic() -> TextStyle {
    copy(with: \.isItalic, setTo: true)
  }
  
  public func roman() -> TextStyle {
    copy(with: \.isItalic, setTo: false)
  }
  
  //MARK: - Case Trait, mutually exclusive
  
  public func capitalized() -> TextStyle {
    copy(with: \.caseTrait, setTo: .capitalized)
  }
  
  public func lowercase() -> TextStyle {
    copy(with: \.caseTrait, setTo: .lowercase)
  }
  
  public func uppercase() -> TextStyle {
    copy(with: \.caseTrait, setTo: .uppercase)
  }
  
  //MARK: - Underline
  
  public func underline(_ style: NSUnderlineStyle) -> TextStyle {
    copy(with: \.underlineStyle, setTo: style)
  }
  
  public func underlineColor(_ color: UIColor?) -> TextStyle {
    copy(with: \.underlineColor, setTo: color)
  }
  
  //MARK: - Strikethrough
  
  public func strikethrough(_ strikethrough: Bool) -> TextStyle {
    copy(with: \.strikethrough, setTo: strikethrough)
  }
  
  public func strikethroughColor(_ color: UIColor?) -> TextStyle {
    copy(with: \.strikeThroughColor, setTo: strikeThroughColor)
  }
  
  //MARK: - Ligatures
  
  public func ligaturesEnabled(_ enabled: Bool) -> TextStyle {
    copy(with: \.ligaturesEnabled, setTo: enabled)
  }
  
  //MARK: - Stroke
  
  public func strokeWidth(_ width: CGFloat) -> TextStyle {
    copy(with: \.strokeWidth, setTo: strokeWidth)
  }
  
  public func strokeColor(_ color: UIColor?) -> TextStyle {
    copy(with: \.strokeColor, setTo: color)
  }
  
  //MARK: - Shadow
  
  public func shadow(_ shadow: NSShadow?) -> TextStyle {
    copy(with: \.shadow, setTo: shadow)
  }
  
  // MARK: - Opacity
  
  public func opacity(_ opacity: CGFloat) -> TextStyle {
    copy(with: \.opacity, setTo: opacity)
  }
  
  //MARK: - Link 
  
  public func link(_ link: String?) -> TextStyle {
    copy(with: \.link, setTo: link)
  }
  
  //MARK: - Offset
  
  public func baselineOffset(absolute offset: CGFloat) -> TextStyle {
    copy(with: \.baselineOffset, setTo: .absolute(offset))
  }
  
  func baselineOffset(relative ratio: CGFloat) -> TextStyle {
    copy(with: \.baselineOffset, setTo: .relative(ratio))
  }
  
  //MARK: - Paragraph style options
  
  public func paragraphStyle(_ style: NSParagraphStyle) -> TextStyle {
    copy(with: \.paragraphStyle, setTo: style.mutableCopy() as! NSMutableParagraphStyle)
  }
  
  public func lineBreakMode(_ mode: NSLineBreakMode) -> TextStyle {
    copy(with: \.paragraphStyle.lineBreakMode, setTo: mode)
  }
  
  public func headIndent(_ indent: CGFloat) -> TextStyle {
    copy(with: \.paragraphStyle.headIndent, setTo: indent)
  }
  
  public func firstLineIndent(_ indent: CGFloat) -> TextStyle {
    copy(with: \.paragraphStyle.firstLineHeadIndent, setTo: indent)
  }
  
  public func paragraphSpacing(_ spacing: CGFloat) -> TextStyle {
    copy(with: \.paragraphStyle.paragraphSpacing, setTo: spacing)
  }
  
  public func paragraphSpacingBefore(_ spacing: CGFloat) -> TextStyle {
    copy(with: \.paragraphStyle.paragraphSpacingBefore, setTo: spacing)
  }
  
  public func alignment(_ alignment: NSTextAlignment) -> TextStyle {
    copy(with: \.paragraphStyle.alignment, setTo: alignment)
  }
  
  public func lineSpacing(_ spacing: CGFloat) -> TextStyle {
    copy(with: \.paragraphStyle.lineSpacing, setTo: spacing)
  }
  
  public func minLineHeight(_ height: CGFloat) -> TextStyle {
    copy(with: \.paragraphStyle.minimumLineHeight, setTo: height)
  }
  
  public func maxLineHeight(_ height: CGFloat) -> TextStyle {
    copy(with: \.paragraphStyle.maximumLineHeight, setTo: height)
  }
  
  // MARK: - Letter spacing
  
  public func letterSpacing(_ spacing: CGFloat) -> TextStyle {
    copy(with: \.letterSpacing, setTo: spacing)
  }
  
  // MARK: - Hyphenation
  
  public func hyphenationFactor(_ factor: Float) -> TextStyle {
    copy(with: \.paragraphStyle.hyphenationFactor, setTo: factor)
  }
  
  // MARK: - Tag scheme
  
  public func tagScheme(_ scheme: TagScheme) -> TextStyle {
    copy(with: \.tagScheme, setTo: scheme)
  }
  
}

private extension TextStyle {
  
  func copy<T>(with keyPath: WritableKeyPath<TextStyle, T>,
               setTo value: T) -> TextStyle {
    var copy = TextStyle.based(on: self)
    copy[keyPath: keyPath] = value
    return copy
  }
}
