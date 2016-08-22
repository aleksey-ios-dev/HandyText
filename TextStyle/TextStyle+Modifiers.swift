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
    let copy = self.copy()
    copy.textAttributes[NSForegroundColorAttributeName] = color
    return copy
  }
  
  func withBackgroundColor(color: UIColor) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSBackgroundColorAttributeName] = color
    return copy
  }
  
  //MARK: - Size
  
  func withSize(size: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.size = size
    return copy
  }
  
  func withSizeIncrementedBy(increment: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.size += increment
    return copy
  }
  
  func withSizeMultipliedBy(multiplicator: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.size *= multiplicator
    return copy
  }
  
  func withDynamicFontStyle(style: DynamicFontStyle) -> TextStyle {
    let copy = self.copy()
    copy.size = UIFont.preferredFontForTextStyle(style.literal).pointSize
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
  
  func withUnderline(style: NSUnderlineStyle) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSUnderlineStyleAttributeName] = style.rawValue
    return copy
  }
  
  func withUnderlineColor(color: UIColor?) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSUnderlineColorAttributeName] = color
    return copy
  }
  
  //MARK: - Strikethrough
  
  func withStrikethrough(strikethrough: Bool) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSStrikethroughStyleAttributeName] = strikethrough
    return copy
  }
  
  func withStrikethroughColor(color: UIColor?) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSStrikethroughColorAttributeName] = color
    return copy
  }
  
  //MARK: - Stroke
  
  func withStrokeWidth(width: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSStrokeWidthAttributeName] = width
    return copy
  }

  func withStrokeColor(color: UIColor?) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSStrokeColorAttributeName] = color
    return copy
  }
  
  //MARK: - Shadow
  
  func withShadow(shadow: NSShadow?) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSShadowAttributeName] = shadow
    return copy
  }
  
  //MARK: - Link 
  
  func withLink(link: String?) -> TextStyle {
    let copy = self.copy()
    if let link = link {
      copy.textAttributes[NSLinkAttributeName] = NSURL(string: link)
    } else {
      copy.textAttributes[NSLinkAttributeName] = nil
    }
    return copy
  }
  
  //MARK: - Offset
  
  func withAbsoluteBaselineOffset(offset: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSBaselineOffsetAttributeName] = offset
    return copy
  }
  
  func withRelativeBaselineOffset(ratio: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.textAttributes[NSBaselineOffsetAttributeName] = size * ratio
    return copy
  }
  
  //MARK: - Paragraph style options
  
  func withParagraphStyle(style: NSParagraphStyle) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle = style.mutableCopy() as! NSMutableParagraphStyle
  
    return copy
  }
  
  func withHeadIndent(indent: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.headIndent = indent
    return copy
  }
  
  func withFirstLineIndent(indent: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.firstLineHeadIndent = indent
    return copy
  }
  
  func withParagraphSpacing(spacing: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.paragraphSpacing = spacing
    return copy
  }

  func withParagraphSpacingBefore(spacing: CGFloat) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.paragraphSpacingBefore = spacing
    return copy
  }

  func withAlignment(alignment: NSTextAlignment) -> TextStyle {
    let copy = self.copy()
    copy.paragraphStyle.alignment = alignment
    return copy
  }

}
