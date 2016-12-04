//
//  TextStyle+Modifiers.swift
//  TextStyle
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

extension TextStyle {
  
  //MARK: - Based on
  
  class func based(on style: TextStyle) -> TextStyle {
    return style.copy()
  }
  
  //MARK: - Fill color
  
  func withForegroundColor(_ color: UIColor) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSForegroundColorAttributeName] = color
    copy.refreshOpacity()
    return copy
  }
  
  func withBackgroundColor(_ color: UIColor) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSBackgroundColorAttributeName] = color
    copy.refreshOpacity()
    return copy
  }
  
  //MARK: - Size
  
  func withSize(_ size: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.size = size
    return copy
  }
  
  func withSizeIncremented(by increment: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.size += increment
    return copy
  }
  
  func withSizeMultiplied(by multiplicator: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.size *= multiplicator
    return copy
  }
  
  func withDynamicFontStyle(_ style: DynamicFontStyle) -> TextStyle {
    let copy = self.copy()
    copy.size = UIFont.preferredFont(forTextStyle: UIFontTextStyle(rawValue: style.literal)).pointSize
  
    return copy
  }
  
  //MARK: - Thickness

  func extralight() -> TextStyle {
    let copy = self.copy()
    copy.thickness = .Extralight
    return copy
  }
  
  func light() -> TextStyle {
    let copy = self.copy()
    copy.thickness = .Light
    return copy
  }
  
  func regular() -> TextStyle {
    let copy = self.copy()
    copy.thickness = .Regular
    return copy
  }
  
  func medium() -> TextStyle {
    let copy = self.copy()
    copy.thickness = .Medium
    return copy
  }
  
  func bold() -> TextStyle {
    let copy = self.copy()
    copy.thickness = .Bold
    return copy
  }
  
  func heavy() -> TextStyle {
    let copy = self.copy()
    copy.thickness = .Heavy
    return copy
  }
  
  func extraheavy() -> TextStyle {
    let copy = self.copy()
    copy.thickness = .Extraheavy
    return copy
  }
  
  //MARK: - Slant
  
  func italic() -> TextStyle {
    let copy = self.copy()
    copy.isItalic = true
    return copy
  }
  
  func straight() -> TextStyle {
    let copy = self.copy()
    copy.isItalic = false
    return copy
  }
  
  //MARK: - Case Trait, mutually exclusive
  
  func capitalized() -> TextStyle {
    let copy = self.copy()
    copy.caseTrait = .Capitalized
    return copy
  }
  
  func lowercase() -> TextStyle {
    let copy = self.copy()
    copy.caseTrait = .Lowercase
    return copy
  }
  
  func uppercase() -> TextStyle {
    let copy = self.copy()
    copy.caseTrait = .Uppercase
    return copy
  }
  
  func normalCase() -> TextStyle {
    let copy = self.copy()
    copy.caseTrait = .Normal
    return copy
  }
  
  //MARK: - Underline
  
  func withUnderline(_ style: NSUnderlineStyle) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSUnderlineStyleAttributeName] = style.rawValue as AnyObject?
    return copy
  }
  
  func withUnderlineColor(_ color: UIColor?) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSUnderlineColorAttributeName] = color
    refreshOpacity()
    return copy
  }
  
  //MARK: - Strikethrough
  
  func withStrikethrough(_ strikethrough: Bool) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSStrikethroughStyleAttributeName] = strikethrough as AnyObject?
    return copy
  }
  
  func withStrikethroughColor(_ color: UIColor?) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSStrikethroughColorAttributeName] = color
    return copy
  }
  
  //MARK: - Stroke
  
  func withStrokeWidth(_ width: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSStrokeWidthAttributeName] = width as AnyObject?
    return copy
  }

  func withStrokeColor(_ color: UIColor?) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSStrokeColorAttributeName] = color
    return copy
  }
  
  //MARK: - Shadow
  
  func withShadow(_ shadow: NSShadow?) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSShadowAttributeName] = shadow
    return copy
  }
  
  // MARK: - Opacity
  
  func withOpacity(_ opacity: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.opacity = opacity
    return copy
  }
  
  //MARK: - Link 
  
  func withLink(_ link: String?) -> TextStyle {
    let copy = self.copy()
    if let link = link {
      copy.textAttributes[NSLinkAttributeName] = NSURL(string: link)
    } else {
      copy.textAttributes[NSLinkAttributeName] = nil
    }
    return copy
  }
  
  //MARK: - Offset
  
  func withBaselineOffset(absolute offset: CGFloat) -> TextStyle {
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
  
  func withParagraphStyle(_ style: NSParagraphStyle) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle = style.mutableCopy() as! NSMutableParagraphStyle
  
    return copy
  }
  
  func withLineBreakMode(_ mode: NSLineBreakMode) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.lineBreakMode = mode
    return copy
  }
  
  func withHeadIndent(_ indent: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.headIndent = indent
    return copy
  }
  
  func withFirstLineIndent(_ indent: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.firstLineHeadIndent = indent
    return copy
  }
  
  func withParagraphSpacing(_ spacing: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.paragraphSpacing = spacing
    return copy
  }

  func withParagraphSpacingBefore(_ spacing: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.paragraphSpacingBefore = spacing
    return copy
  }

  func withAlignment(_ alignment: NSTextAlignment) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.alignment = alignment
    return copy
  }
  
  func withLineSpacing(_ spacing: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.lineSpacing = spacing
    return copy
  }
  
  // MARK: - Letter spacing
  
  func withLetterSpacing(_ spacing: CGFloat) -> TextStyle {
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
