//
//  ViewController.swift
//  Assignment 2
//
//  Created by Jackson on 9/22/15.
//  Copyright © 2015 Jackson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var labelNumber = 0
  var counter = 0
  let firstArray = [0,1,2,3,4,5]
  let secondArray = [100,101,102,103,104,105]
  
  @IBOutlet weak var label1: UILabel!
  @IBOutlet weak var label2: UILabel!
  @IBOutlet weak var label3: UILabel!
  @IBOutlet weak var label4: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    label1.text = "\(labelNumber)"
    label2.text = "\(labelNumber)"
    label3.text = "\(firstArray[counter])"
    label4.text = "\(secondArray[counter])"
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func increaseNumberInLabel(sender: AnyObject) {
    labelNumber++
    counter++
    
    if labelNumber > 10 {
      labelNumber = 0
    }
    
    if counter == firstArray.count {
      counter = 0
    }
    
    label1.text = "\(labelNumber)"
    label2.text = "\(labelNumber)"
    label3.text = "\(firstArray[counter])"
    label4.text = "\(secondArray[counter])"
  }

}

