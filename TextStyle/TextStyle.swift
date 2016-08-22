//
//  TextStyle.swift
//  Styles
//
//  Created by aleksey on 24.06.16.
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

class TextStyle {
  
	enum CaseTrait {
		case Normal, Capitalized, Lowercase, Uppercase
	}
  
  var textAttributes = [String: AnyObject]()
	
  var font: Font {
    didSet { refreshFont() }
  }
  
  var size = UIFont.preferredFontForTextStyle(UIFontTextStyleBody).pointSize {
    didSet { refreshFont() }
  }

  var thickness = Font.Thickness.Regular {
    didSet { refreshFont() }
  }
  
  var caseTrait: CaseTrait = .Normal {
    didSet { refreshFont() }
  }

  var isItalic = false {
    didSet { refreshFont() }
  }
  
  var paragraphStyle: NSMutableParagraphStyle {
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
	
	var typeface: String {
		get {
			switch thickness {
			case .Extralight:
				return isItalic ? font.extralightItalic : font.extralight
			case .Light:
				return isItalic ? font.lightItalic : font.light
			case .Regular:
				return isItalic ? font.italic : font.regular
      case .Medium:
        return isItalic ? font.mediumItalic : font.medium
			case .Bold:
				return isItalic ? font.boldItalic : font.bold
			case .Heavy:
				return isItalic ? font.heavyItalic : font.heavy
			case .Extraheavy:
				return isItalic ? font.extraheavyItalic : font.extraheavy
			}
		}
	}
	
  enum DynamicFontStyle {
    
    case Title1, Title2, Title3, Headline, Subheadline, Body, Callout, Footnote, Caption1, Caption2
    
    var literal: String {
      switch self {
      case .Title1:
        return UIFontTextStyleTitle1
      case .Title2:
        return UIFontTextStyleTitle2
      case .Title3:
        return UIFontTextStyleTitle3
      case .Headline:
        return UIFontTextStyleHeadline
      case .Subheadline:
        return UIFontTextStyleSubheadline
      case .Body:
        return UIFontTextStyleBody
      case Callout:
        return UIFontTextStyleCallout
      case .Footnote:
        return UIFontTextStyleFootnote
      case .Caption1:
        return UIFontTextStyleCaption1
      case .Caption2:
        return UIFontTextStyleCaption2
      }
    }
  }
  
	init(font: Font) {
		self.font = font
    refreshFont()
	}
  
  private func refreshFont() {
    textAttributes[NSFontAttributeName] = UIFont.init(name: typeface, size: size)
  }
  
  func copy() -> TextStyle {
    let copy = TextStyle(font: font)
    copy.textAttributes = textAttributes
    copy.size = size
    copy.thickness = thickness
    copy.caseTrait = caseTrait
    copy.isItalic = isItalic
    copy.paragraphStyle = paragraphStyle
    
    return copy;
  }
	
}