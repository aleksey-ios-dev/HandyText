//
//  TextStyle.swift
//  HandyText
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

//TODO: generate attributes on demand to avoid recalculations

public class TextStyle {
  
  public enum BaselineOffset {
    case none
    case absolute(CGFloat)
    case relative(CGFloat)
  }
  
  public enum CaseTrait {
    case none, capitalized, lowercase, uppercase
  }
  
  public var textAttributes: [NSAttributedStringKey: AnyObject] {
    get {
      var attributes = [NSAttributedStringKey: AnyObject]()
      attributes[.foregroundColor] = foregroundColor.withAlphaComponent(opacity)
      attributes[.backgroundColor] = backgroundColor?.withAlphaComponent(opacity)
      attributes[.strikethroughColor] = strikeThroughColor?.withAlphaComponent(opacity)
      attributes[.strokeColor] = strokeColor?.withAlphaComponent(opacity)
      attributes[.strokeWidth] = strokeWidth as AnyObject?
      attributes[.paragraphStyle] = paragraphStyle
      attributes[.font] = UIFont(name: typeface, size: size)
      attributes[.ligature] = ligaturesEnabled as AnyObject?
      attributes[.strikethroughStyle] = Int(strikethrough ? 1 : 0) as AnyObject?
      attributes[.underlineStyle] = underlineStyle.rawValue as AnyObject?
      attributes[.underlineColor] = underlineColor?.withAlphaComponent(opacity)
      attributes[.shadow] = shadow
      attributes[.link] = link as AnyObject?
      
      let calculatedOffset: CGFloat
      switch baselineOffset {
      case .absolute(let offset):
        calculatedOffset = offset
      case .relative(let offset):
        calculatedOffset = offset * size
      case .none:
        calculatedOffset = 0.0
      }
      
      attributes[.baselineOffset] = calculatedOffset as AnyObject?
      
      return attributes
    }
  }
  
  public var paragraphStyle = NSMutableParagraphStyle()
  
  /// STATE

  public var font: Font
  public var size: CGFloat = UIFont.preferredFont(forTextStyle: .body).pointSize
  public var thickness = Font.Thickness.regular
  public var caseTrait = CaseTrait.none
  public var isItalic = false
  public var opacity: CGFloat = 1.0
  public var foregroundColor = UIColor.black
  public var backgroundColor: UIColor?
  public var underlineColor: UIColor?
  public var strikeThroughColor: UIColor?
  public var strokeColor: UIColor?
  public var underlineStyle = NSUnderlineStyle.styleNone
  public var strikethrough = false
  public var ligaturesEnabled = false
  public var strokeWidth: CGFloat = 0.0
  public var shadow: NSShadow?
  public var link: String?
  public var baselineOffset = BaselineOffset.none
  public var letterSpacing: CGFloat?
  
	public var typeface: String {
		get {
			switch thickness {
			case .extralight:
				return isItalic ? font.extralightItalic : font.extralight
			case .light:
				return isItalic ? font.lightItalic : font.light
			case .regular:
				return isItalic ? font.italic : font.regular
      case .medium:
        return isItalic ? font.mediumItalic : font.medium
			case .bold:
				return isItalic ? font.boldItalic : font.bold
			case .heavy:
				return isItalic ? font.heavyItalic : font.heavy
			case .extraheavy:
				return isItalic ? font.extraheavyItalic : font.extraheavy
			}
		}
	}
	
  public enum DynamicFontStyle {
    
    case title1, title2, title3, headline, subheadline, body, callout, footnote, caption1, caption2
    
    var literal: String {
      switch self {
      case .title1:
        return UIFontTextStyle.title1.rawValue
      case .title2:
        return UIFontTextStyle.title2.rawValue
      case .title3:
        return UIFontTextStyle.title3.rawValue
      case .headline:
        return UIFontTextStyle.headline.rawValue
      case .subheadline:
        return UIFontTextStyle.subheadline.rawValue
      case .body:
        return UIFontTextStyle.body.rawValue
      case .callout:
        return UIFontTextStyle.callout.rawValue
      case .footnote:
        return UIFontTextStyle.footnote.rawValue
      case .caption1:
        return UIFontTextStyle.caption1.rawValue
      case .caption2:
        return UIFontTextStyle.caption2.rawValue
      }
    }
  }
  
	public init(font: Font) {
		self.font = font
	}
  
  public func copy() -> TextStyle {
    let copy = TextStyle(font: font)
    copy.size = size
    copy.thickness = thickness
    copy.caseTrait = caseTrait
    copy.isItalic = isItalic
    copy.paragraphStyle = paragraphStyle
    copy.opacity = opacity
    copy.foregroundColor = foregroundColor
    copy.backgroundColor = backgroundColor
    copy.strikeThroughColor = strikeThroughColor
    copy.underlineColor = underlineColor
    copy.underlineStyle = underlineStyle
    copy.strikethrough = strikethrough
    copy.ligaturesEnabled = ligaturesEnabled
    copy.strokeColor = strokeColor
    copy.strokeWidth = strokeWidth
    copy.shadow = shadow
    copy.link = link
    copy.letterSpacing = letterSpacing
    copy.baselineOffset = baselineOffset
    
    return copy
  }
	
}
