//
//  PersonDetailViewController.swift
//  Assignment 2
//
//  Created by Jackson on 9/29/15.
//  Copyright © 2015 Jackson. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITextFieldDelegate {

  var firstName : String?
  var lastName : String?
  var image : UIImage?
  var selectedPerson : Person!

  @IBOutlet weak var personPhoto: UIImageView!
  
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    firstNameTextField.delegate = self
    firstNameTextField.text = selectedPerson.firstName
    lastNameTextField.delegate = self
    lastNameTextField.text = selectedPerson.lastName
    imageView.image = selectedPerson.image
      // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(animated: Bool) {

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    
    textField.resignFirstResponder()
    
    if let firstName = firstNameTextField.text {
      selectedPerson.firstName = firstName
    }
    
    if let lastName = lastNameTextField.text {
      selectedPerson.lastName = lastName
    }

    return true
  }
  
  
}
