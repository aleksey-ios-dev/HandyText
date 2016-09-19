//
//  ViewController.swift
//  TextStyleExample
//
//  Created by Aleksey on 04.07.16.
//  Copyright © 2016 Aleksey Chernish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet
  private weak var label: UILabel!
  
  @IBOutlet
  private weak var textField: UITextField!
  
  @IBOutlet
  private weak var textview: UITextView!
  
  @IBOutlet
  private weak var button: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.applyAttributesFrom(TextStyle.header.withForegroundColor(.blackColor()))
    
    title = "Text style demo"
     
    label.attributedText = "about <i>zebras</i>".withStyle(.header, tagScheme: .`default`)

    textField.applyAttributesFrom(.plainText)

    textField.attributedPlaceholder = "search".withStyle(TextStyle.plainText.withForegroundColor(.lightGrayColor()).italic())
    
    let textViewText = "Zebras are several species of African equids (horse family) united by their distinctive black and white striped coats. Their stripes come in different patterns, unique to each individual."
    
    textview.attributedText = textViewText.withStyle(.plainText).applyStyle(.url, toOccurencesOf: "species")
    
    button.setAttributedTitle("Got it!".withStyle(.button), forState: .Normal)
  }

}
