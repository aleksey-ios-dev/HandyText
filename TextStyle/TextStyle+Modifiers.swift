//
//  TextStyle+Modifiers.swift
//  Styles
//
//  Created by aleksey on 24.06.16.
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

extension TextStyle {
  
  //MARK: - Fill color
  
  func withForegroundColor(color: UIColor) -> TextStyle {
    textAttributes[NSForegroundColorAttributeName] = color
    return self
  }
  
  func withBackgroundColor(color: UIColor) -> TextStyle {
    textAttributes[NSBackgroundColorAttributeName] = color
    return self
  }
  
  //MARK: - Size
  
  func withSize(size: CGFloat) -> TextStyle {
    self.size = size
    return self
  }
  
  func withSizeIncrementedBy(increment: CGFloat) -> TextStyle {
    size += increment
    return self
  }
  
  func withSizeMultipliedBy(multiplicator: CGFloat) -> TextStyle {
    size *= multiplicator
    return self
  }
  
  func withDynamicFontStyle(size: DynamicFontStyle) -> TextStyle {
    self.size = UIFont.preferredFontForTextStyle(size.literal).pointSize
    return self
  }
  
  //MARK: - Thickness

  func extralight() -> TextStyle {
    self.thickness = .Extralight
    return self
  }
  
  func light() -> TextStyle {
    self.thickness = .Light
    return self
  }
  
  func regular() -> TextStyle {
    self.thickness = .Regular
    return self
  }
  
  func medium() -> TextStyle {
    self.thickness = .Medium
    return self
  }
  
  func bold() -> TextStyle {
    self.thickness = .Bold
    return self
  }
  
  func heavy() -> TextStyle {
    self.thickness = .Heavy
    return self
  }
  
  func extraheavy() -> TextStyle {
    self.thickness = .Extraheavy
    return self
  }
  
  //MARK: - Slant
  
  func italic() -> TextStyle {
    self.isItalic = true
    return self
  }
  
  func straight() -> TextStyle {
    self.isItalic = false
    return self
  }
  
  //MARK: - Case Trait, mutually exclusive
  
  func capitalized() -> TextStyle {
    caseTrait = .Capitalized
    return self
  }
  
  func lowercase() -> TextStyle {
    caseTrait = .Lowercase
    return self
  }
  
  func uppercase() -> TextStyle {
    caseTrait = .Uppercase
    return self
  }
  
  func normalCase() -> TextStyle {
    caseTrait = .Normal
    return self
  }
  
  //MARK: - Underline
  
  func withUnderline(style: NSUnderlineStyle) -> TextStyle {
    textAttributes[NSUnderlineStyleAttributeName] = style.rawValue
    return self
  }
  
  func withUnderlineColor(color: UIColor?) -> TextStyle {
    textAttributes[NSUnderlineColorAttributeName] = color
    return self
  }
  
  //MARK: - Strikethrough
  
  func withStrikethrough(strikethrough: Bool) -> TextStyle {
    textAttributes[NSStrikethroughStyleAttributeName] = strikethrough
    return self
  }
  
  func withStrikethroughColor(color: UIColor?) -> TextStyle {
    textAttributes[NSStrikethroughColorAttributeName] = color
    return self
  }
  
  //MARK: - Stroke
  
  func withStrokeWidth(width: CGFloat) -> TextStyle {
    textAttributes[NSStrokeWidthAttributeName] = width
    return self
  }

  func withStrokeColor(color: UIColor?) -> TextStyle {
    textAttributes[NSStrokeColorAttributeName] = color
    return self
  }
  
  //MARK: - Shadow
  
  func withShadow(shadow: NSShadow?) -> TextStyle {
    textAttributes[NSShadowAttributeName] = shadow
    return self
  }
  
  //MARK: - Link 
  
  func withLink(link: String?) -> TextStyle {
    if let link = link {
      textAttributes[NSLinkAttributeName] = NSURL(string: link)
    } else {
      textAttributes[NSLinkAttributeName] = nil
    }
    return self
  }
  
  //MARK: - Offset
  
  func withAbsoluteBaselineOffset(offset: CGFloat) -> TextStyle {
    textAttributes[NSBaselineOffsetAttributeName] = offset
    return self
  }
  
  func withRelativeBaselineOffset(ratio: CGFloat) -> TextStyle {
    textAttributes[NSBaselineOffsetAttributeName] = size * ratio
    return self
  }
  
  //MARK: - Paragraph style options
  
  func withParagraphStyle(style: NSParagraphStyle) -> TextStyle {
    paragraphStyle = style.mutableCopy() as! NSMutableParagraphStyle
  
    return self
  }
  
  func withHeadIndent(indent: CGFloat) -> TextStyle {
    paragraphStyle.headIndent = indent
    return self
  }
  
  func withFirstLineIndent(indent: CGFloat) -> TextStyle {
    paragraphStyle.firstLineHeadIndent = indent
    return self
  }
  
  func withParagraphSpacing(spacing: CGFloat) -> TextStyle {
    paragraphStyle.paragraphSpacing = spacing
    return self
  }

  func withParagraphSpacingBefore(spacing: CGFloat) -> TextStyle {
    paragraphStyle.paragraphSpacingBefore = spacing
    return self
  }

  func withAlignment(alignment: NSTextAlignment) -> TextStyle {
    paragraphStyle.alignment = alignment
    return self
  }

}
