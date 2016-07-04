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
    
    label.attributedText = "Hello".withStyle(TextStyle.header)
  }


}

