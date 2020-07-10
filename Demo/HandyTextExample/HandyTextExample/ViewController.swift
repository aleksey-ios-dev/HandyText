//
//  ViewController.swift
//  HandyTextExample
//
//  Created by Aleksey on 04.12.16.
//  Copyright © 2016 aleksey chernish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet
  private weak var label: UILabel!
  
  @IBOutlet
  private weak var textField: UITextField!
  
  @IBOutlet
  private weak var textView: UITextView!
  
  @IBOutlet
  private weak var button: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    navigationController?.navigationBar.applyAttributes(from: TextStyle.header.foregroundColor(.black))
    
    title = "Handy text demo"
    
    label.setText("<u>about</u> <i>zebras</i>", with: TextStyle.header.tagScheme(.default))

    textField.applyAttributes(from: .plainText)
    
    textField.attributedPlaceholder = "search".withStyle(
      TextStyle.plainText
        .foregroundColor(.lightGray)
        .italic()
    )
    
    let textViewText = "Zebras are several species of African equids (horse family) united by their distinctive black and white striped coats. Their stripes come in different patterns, unique to each individual."
    
    textView.attributedText = textViewText
      .withStyle(.plainText)
      .applyStyle(.url, toOccurencesOf: "species")
    
    button.setAttributedTitle("Got it!".withStyle(.button), for: .normal)
  }
  
}
