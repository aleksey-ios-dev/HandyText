//
//  TextStyle+Modifiers.swift
//  HandyText
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

extension TextStyle {
  
  //MARK: - Based on
  
  public class func based(on style: TextStyle) -> TextStyle {
    return style.copy()
  }
  
  //MARK: - Fill color
  
  public func withForegroundColor(_ color: UIColor) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSForegroundColorAttributeName] = color
    copy.refreshOpacity()
    return copy
  }
  
  public func withBackgroundColor(_ color: UIColor) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSBackgroundColorAttributeName] = color
    copy.refreshOpacity()
    return copy
  }
  
  //MARK: - Size
  
  public func withSize(_ size: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.size = size
    return copy
  }
  
  public func withSizeIncremented(by increment: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.size += increment
    return copy
  }
  
  public func withSizeMultiplied(by multiplicator: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.size *= multiplicator
    return copy
  }
  
  public func withDynamicFontStyle(_ style: DynamicFontStyle) -> TextStyle {
    let copy = self.copy()
    copy.size = UIFont.preferredFont(forTextStyle: UIFontTextStyle(rawValue: style.literal)).pointSize
  
    return copy
  }
  
  //MARK: - Thickness

  public func extralight() -> TextStyle {
    let copy = self.copy()
    copy.thickness = .extralight
    return copy
  }
  
  public func light() -> TextStyle {
    let copy = self.copy()
    copy.thickness = .light
    return copy
  }
  
  public func regular() -> TextStyle {
    let copy = self.copy()
    copy.thickness = .regular
    return copy
  }
  
  public func medium() -> TextStyle {
    let copy = self.copy()
    copy.thickness = .medium
    return copy
  }
  
  public func bold() -> TextStyle {
    let copy = self.copy()
    copy.thickness = .bold
    return copy
  }
  
  public func heavy() -> TextStyle {
    let copy = self.copy()
    copy.thickness = .heavy
    return copy
  }
  
  public func extraheavy() -> TextStyle {
    let copy = self.copy()
    copy.thickness = .extraheavy
    return copy
  }
  
  //MARK: - Slant
  
  public func italic() -> TextStyle {
    let copy = self.copy()
    copy.isItalic = true
    return copy
  }
  
  public func straight() -> TextStyle {
    let copy = self.copy()
    copy.isItalic = false
    return copy
  }
  
  //MARK: - Case Trait, mutually exclusive
  
  public func capitalized() -> TextStyle {
    let copy = self.copy()
    copy.caseTrait = .capitalized
    return copy
  }
  
  public func lowercase() -> TextStyle {
    let copy = self.copy()
    copy.caseTrait = .lowercase
    return copy
  }
  
  public func uppercase() -> TextStyle {
    let copy = self.copy()
    copy.caseTrait = .uppercase
    return copy
  }
  
  public func normalCase() -> TextStyle {
    let copy = self.copy()
    copy.caseTrait = .normal
    return copy
  }
  
  //MARK: - Underline
  
  public func withUnderline(_ style: NSUnderlineStyle) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSUnderlineStyleAttributeName] = style.rawValue as AnyObject?
    return copy
  }
  
  public func withUnderlineColor(_ color: UIColor?) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSUnderlineColorAttributeName] = color
    refreshOpacity()
    return copy
  }
  
  //MARK: - Strikethrough
  
  public func withStrikethrough(_ strikethrough: Bool) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSStrikethroughStyleAttributeName] = strikethrough as AnyObject?
    return copy
  }
  
  public func withStrikethroughColor(_ color: UIColor?) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSStrikethroughColorAttributeName] = color
    return copy
  }
  
  //MARK: - Ligatures
  
  public func withLigatures(enabled: Bool) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSLigatureAttributeName] = NSNumber(integerLiteral: enabled ? 1 : 0)
    return copy
  }
  
  //MARK: - Stroke
  
  public func withStrokeWidth(_ width: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSStrokeWidthAttributeName] = width as AnyObject?
    return copy
  }

  public func withStrokeColor(_ color: UIColor?) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSStrokeColorAttributeName] = color
    return copy
  }
  
  //MARK: - Shadow
  
  public func withShadow(_ shadow: NSShadow?) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSShadowAttributeName] = shadow
    return copy
  }
  
  // MARK: - Opacity
  
  public func withOpacity(_ opacity: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.opacity = opacity
    return copy
  }
  
  //MARK: - Link 
  
  public func withLink(_ link: String?) -> TextStyle {
    let copy = self.copy()
    if let link = link {
      copy.textAttributes[NSLinkAttributeName] = NSURL(string: link)
    } else {
      copy.textAttributes[NSLinkAttributeName] = nil
    }
    return copy
  }
  
  //MARK: - Offset
  
  public func withBaselineOffset(absolute offset: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSBaselineOffsetAttributeName] = offset as AnyObject?
    return copy
  }
  
  func withBaselineOffset(relative ratio: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSBaselineOffsetAttributeName] = (size * ratio) as AnyObject?
    return copy
  }
  
  //MARK: - Paragraph style options
  
  public func withParagraphStyle(_ style: NSParagraphStyle) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle = style.mutableCopy() as! NSMutableParagraphStyle
  
    return copy
  }
  
  public func withLineBreakMode(_ mode: NSLineBreakMode) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.lineBreakMode = mode
    return copy
  }
  
  public func withHeadIndent(_ indent: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.headIndent = indent
    return copy
  }
  
  public func withFirstLineIndent(_ indent: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.firstLineHeadIndent = indent
    return copy
  }
  
  public func withParagraphSpacing(_ spacing: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.paragraphSpacing = spacing
    return copy
  }

  public func withParagraphSpacingBefore(_ spacing: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.paragraphSpacingBefore = spacing
    return copy
  }

  public func withAlignment(_ alignment: NSTextAlignment) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.alignment = alignment
    return copy
  }
  
  public func withLineSpacing(_ spacing: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.lineSpacing = spacing
    return copy
  }
  
  // MARK: - Letter spacing
  
  public func withLetterSpacing(_ spacing: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSKernAttributeName] = spacing as AnyObject?
    return copy
  }
  
  // MARK: - Private

  private func refreshOpacity() {
    let newOpacity = self.opacity
    self.opacity = newOpacity
  }

}
