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
    return modifyingCopy(by: \.foregroundColor, with: color)
  }
  
  public func backgroundColor(_ color: UIColor) -> TextStyle {
    return modifyingCopy(by: \.backgroundColor, with: color)
  }
  
  //MARK: - Size
  
  public func size(_ size: CGFloat) -> TextStyle {
    modifyingCopy(by: \.size, with: size)
  }
  
  public func sizeIncremented(by increment: CGFloat) -> TextStyle {
    modifyingCopy(by: \.size, with: size + increment)
  }
  
  public func sizeMultiplied(by multiplier: CGFloat) -> TextStyle {
    modifyingCopy(by: \.size, with: size * multiplier)
  }
  
  public func dynamicFontStyle(_ style: DynamicFontStyle) -> TextStyle {
    modifyingCopy(by: \.size, with:  UIFont.preferredFont(forTextStyle: UIFont.TextStyle(rawValue: style.literal)).pointSize)
  }
  
  //MARK: - Thickness
  
  public func extralight() -> TextStyle {
    modifyingCopy(by: \.thickness, with: .extralight)
  }
  
  public func light() -> TextStyle {
    modifyingCopy(by: \.thickness, with: .light)
  }
  
  public func regular() -> TextStyle {
    modifyingCopy(by: \.thickness, with: .regular)
  }
  
  public func medium() -> TextStyle {
    modifyingCopy(by: \.thickness, with: .medium)
  }
  
  public func bold() -> TextStyle {
    modifyingCopy(by: \.thickness, with: .bold)
  }
  
  public func heavy() -> TextStyle {
    modifyingCopy(by: \.thickness, with: .heavy)
  }
  
  public func extraheavy() -> TextStyle {
    modifyingCopy(by: \.thickness, with: .extraheavy)
  }
  
  //MARK: - Slant
  
  public func italic() -> TextStyle {
    modifyingCopy(by: \.isItalic, with: true)
  }
  
  public func roman() -> TextStyle {
    modifyingCopy(by: \.isItalic, with: false)
  }
  
  //MARK: - Case Trait, mutually exclusive
  
  public func capitalized() -> TextStyle {
    modifyingCopy(by: \.caseTrait, with: .capitalized)
  }
  
  public func lowercase() -> TextStyle {
    modifyingCopy(by: \.caseTrait, with: .lowercase)
  }
  
  public func uppercase() -> TextStyle {
    modifyingCopy(by: \.caseTrait, with: .uppercase)
  }
  
  //MARK: - Underline
  
  public func underline(_ style: NSUnderlineStyle) -> TextStyle {
    modifyingCopy(by: \.underlineStyle, with: style)
  }
  
  public func underlineColor(_ color: UIColor?) -> TextStyle {
    modifyingCopy(by: \.underlineColor, with: color)
  }
  
  //MARK: - Strikethrough
  
  public func strikethrough(_ strikethrough: Bool) -> TextStyle {
    modifyingCopy(by: \.strikethrough, with: strikethrough)
  }
  
  public func strikethroughColor(_ color: UIColor?) -> TextStyle {
    modifyingCopy(by: \.strikeThroughColor, with: strikeThroughColor)
  }
  
  //MARK: - Ligatures
  
  public func ligaturesEnabled(_ enabled: Bool) -> TextStyle {
    modifyingCopy(by: \.ligaturesEnabled, with: enabled)
  }
  
  //MARK: - Stroke
  
  public func strokeWidth(_ width: CGFloat) -> TextStyle {
    modifyingCopy(by: \.strokeWidth, with: strokeWidth)
  }
  
  public func strokeColor(_ color: UIColor?) -> TextStyle {
    modifyingCopy(by: \.strokeColor, with: color)
  }
  
  //MARK: - Shadow
  
  public func shadow(_ shadow: NSShadow?) -> TextStyle {
    modifyingCopy(by: \.shadow, with: shadow)
  }
  
  // MARK: - Opacity
  
  public func opacity(_ opacity: CGFloat) -> TextStyle {
    modifyingCopy(by: \.opacity, with: opacity)
  }
  
  //MARK: - Link 
  
  public func link(_ link: String?) -> TextStyle {
    modifyingCopy(by: \.link, with: link)
  }
  
  //MARK: - Offset
  
  public func baselineOffset(absolute offset: CGFloat) -> TextStyle {
    modifyingCopy(by: \.baselineOffset, with: .absolute(offset))
  }
  
  func baselineOffset(relative ratio: CGFloat) -> TextStyle {
    modifyingCopy(by: \.baselineOffset, with: .relative(ratio))
  }
  
  //MARK: - Paragraph style options
  
  public func paragraphStyle(_ style: NSParagraphStyle) -> TextStyle {
    modifyingCopy(by: \.paragraphStyle, with: style.mutableCopy() as! NSMutableParagraphStyle)
  }
  
  public func lineBreakMode(_ mode: NSLineBreakMode) -> TextStyle {
    modifyingCopy(by: \.paragraphStyle.lineBreakMode, with: mode)
  }
  
  public func headIndent(_ indent: CGFloat) -> TextStyle {
    modifyingCopy(by: \.paragraphStyle.headIndent, with: indent)
  }
  
  public func firstLineIndent(_ indent: CGFloat) -> TextStyle {
    modifyingCopy(by: \.paragraphStyle.firstLineHeadIndent, with: indent)
  }
  
  public func paragraphSpacing(_ spacing: CGFloat) -> TextStyle {
    modifyingCopy(by: \.paragraphStyle.paragraphSpacing, with: spacing)
  }
  
  public func paragraphSpacingBefore(_ spacing: CGFloat) -> TextStyle {
    modifyingCopy(by: \.paragraphStyle.paragraphSpacingBefore, with: spacing)
  }
  
  public func alignment(_ alignment: NSTextAlignment) -> TextStyle {
    modifyingCopy(by: \.paragraphStyle.alignment, with: alignment)
  }
  
  public func lineSpacing(_ spacing: CGFloat) -> TextStyle {
    modifyingCopy(by: \.paragraphStyle.lineSpacing, with: spacing)
  }
  
  // MARK: - Letter spacing
  
  public func letterSpacing(_ spacing: CGFloat) -> TextStyle {
    modifyingCopy(by: \.letterSpacing, with: spacing)
  }
  
  // MARK: - Tag scheme
  
  public func tagScheme(_ scheme: TagScheme) -> TextStyle {
    modifyingCopy(by: \.tagScheme, with: scheme)
  }
  
}

private extension TextStyle {
  
  func modifyingCopy<T>(by keyPath: WritableKeyPath<TextStyle, T>, with: T) -> TextStyle {
    var based = TextStyle.based(on: self)
    based[keyPath: keyPath] = with
    return based
  }
}
