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
  
  public var textAttributes: [String: AnyObject] {
    get {
      var attributes = [String: AnyObject]()
      attributes[NSForegroundColorAttributeName] = foregroundColor.withAlphaComponent(opacity)
      attributes[NSBackgroundColorAttributeName] = backgroundColor?.withAlphaComponent(opacity)
      attributes[NSStrikethroughColorAttributeName] = strikeThroughColor?.withAlphaComponent(opacity)
      attributes[NSStrokeColorAttributeName] = strokeColor?.withAlphaComponent(opacity)
      attributes[NSStrokeWidthAttributeName] = strokeWidth as AnyObject?
      attributes[NSParagraphStyleAttributeName] = paragraphStyle
      attributes[NSFontAttributeName] = UIFont(name: typeface, size: size)
      attributes[NSLigatureAttributeName] = ligaturesEnabled as AnyObject?
      attributes[NSStrikethroughStyleAttributeName] = Int(strikethrough ? 1 : 0) as AnyObject?
      attributes[NSUnderlineStyleAttributeName] = underlineStyle.rawValue as AnyObject?
      attributes[NSUnderlineColorAttributeName] = underlineColor?.withAlphaComponent(opacity)
      attributes[NSShadowAttributeName] = shadow
      attributes[NSLinkAttributeName] = link as AnyObject?
      
      let calculatedOffset: CGFloat
      switch baselineOffset {
      case .absolute(let offset):
        calculatedOffset = offset
      case .relative(let offset):
        calculatedOffset = offset * size
      case .none:
        calculatedOffset = 0.0
      }
      
      attributes[NSBaselineOffsetAttributeName] = calculatedOffset as AnyObject?
      
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
    
    case Title1, Title2, Title3, Headline, Subheadline, Body, Callout, Footnote, Caption1, Caption2
    
    var literal: String {
      switch self {
      case .Title1:
        return UIFontTextStyle.title1.rawValue
      case .Title2:
        return UIFontTextStyle.title2.rawValue
      case .Title3:
        return UIFontTextStyle.title3.rawValue
      case .Headline:
        return UIFontTextStyle.headline.rawValue
      case .Subheadline:
        return UIFontTextStyle.subheadline.rawValue
      case .Body:
        return UIFontTextStyle.body.rawValue
      case .Callout:
        return UIFontTextStyle.callout.rawValue
      case .Footnote:
        return UIFontTextStyle.footnote.rawValue
      case .Caption1:
        return UIFontTextStyle.caption1.rawValue
      case .Caption2:
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
