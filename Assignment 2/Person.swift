//
//  Person.swift
//  Assignment 2
//
//  Created by Jackson on 9/29/15.
//  Copyright © 2015 Jackson. All rights reserved.
//

import UIKit

class Person : NSObject, NSCoding {
  var firstName : String
  var lastName : String
  var image : UIImage?
  
  init(fName : String, lName : String) {
    firstName = fName
    lastName = lName
  }
  
  required init?(coder aDecoder: NSCoder) {
    if let firstName = aDecoder.decodeObjectForKey("firstName") as? String {
      self.firstName = firstName
    } else {
      self.firstName = "NA"
    }
    if let lastName = aDecoder.decodeObjectForKey("lastName") as? String {
      self.lastName = lastName
    } else {
      self.lastName = "NA"
    }
    if let data = aDecoder.decodeObjectForKey("image") as? NSData {
      self.image = UIImage(data: data)
    }
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(firstName, forKey: "firstName")
    aCoder.encodeObject(lastName, forKey: "lastName")
    if let image = image {
      if let data = UIImagePNGRepresentation(image) {
        aCoder.encodeObject(data, forKey: "image")
      }
    }
  }

}


