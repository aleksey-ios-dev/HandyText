//
//  TextStyle.swift
//  HandyText
//
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

public class TextStyle {
  
	public enum CaseTrait {
		case normal, capitalized, lowercase, uppercase
	}
  
  public var textAttributes: [String: AnyObject] = {
    var attributes = [String: AnyObject]()
    attributes[NSForegroundColorAttributeName] = UIColor.black
    
    return attributes
  }()
	
  public var font: Font {
    didSet { refreshFont() }
  }
  
  public var size = UIFont.preferredFont(forTextStyle: .body).pointSize {
    didSet { refreshFont() }
  }

  public var thickness = Font.Thickness.regular {
    didSet { refreshFont() }
  }
  
  public var caseTrait: CaseTrait = .normal {
    didSet { refreshFont() }
  }

  public var isItalic = false {
    didSet { refreshFont() }
  }
  
  public var paragraphStyle: NSMutableParagraphStyle {
    get {
      if let style = textAttributes[NSParagraphStyleAttributeName] as? NSMutableParagraphStyle{
        return style
      } else {
        let style = NSMutableParagraphStyle()
        textAttributes[NSParagraphStyleAttributeName] = style
        return style
      }
    }
    set {
      textAttributes[NSParagraphStyleAttributeName] = newValue
    }
  }
  
  public var opacity: CGFloat = 1.0 {
    didSet {
      if let foregroundColor = textAttributes[NSForegroundColorAttributeName] as? UIColor {
        textAttributes[NSForegroundColorAttributeName] = foregroundColor.withAlphaComponent(opacity)
      }
      
      if let backgroundColor = textAttributes[NSBackgroundColorAttributeName] as? UIColor {
        textAttributes[NSBackgroundColorAttributeName] = backgroundColor.withAlphaComponent(opacity)
      }
      
      if let underlineColor = textAttributes[NSUnderlineColorAttributeName] as? UIColor {
        textAttributes[NSUnderlineColorAttributeName] = underlineColor.withAlphaComponent(opacity)
      }
      
      if let strikeThroughColor = textAttributes[NSStrikethroughColorAttributeName] as? UIColor {
        textAttributes[NSStrikethroughColorAttributeName] = strikeThroughColor.withAlphaComponent(opacity)
      }
      
      if let strokeColor = textAttributes[NSStrokeColorAttributeName] as? UIColor {
        textAttributes[NSStrokeColorAttributeName] = strokeColor.withAlphaComponent(opacity)
      }
    }
  }
	
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
    refreshFont()
	}
  
  private func refreshFont() {
    textAttributes[NSFontAttributeName] = UIFont.init(name: typeface, size: size)
  }
  
  public func copy() -> TextStyle {
    let copy = TextStyle(font: font)
    copy.textAttributes = textAttributes
    copy.size = size
    copy.thickness = thickness
    copy.caseTrait = caseTrait
    copy.isItalic = isItalic
    copy.paragraphStyle = paragraphStyle
    copy.opacity = opacity
    
    return copy
  }
	
}
