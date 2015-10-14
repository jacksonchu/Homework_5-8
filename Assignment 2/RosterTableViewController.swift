//
//  RosterTableViewController.swift
//  Assignment 2
//
//  Created by Jackson on 9/24/15.
//  Copyright © 2015 Jackson. All rights reserved.
//

import UIKit

class RosterTableViewController: UIViewController, UITableViewDataSource {
  
  
  let firstNames = ["Jane","Joe","John","Jim","Janelle"]
  let lastNames = ["Doe","Brown","Smith","Gore","Chomski"]
  let shermanImage = UIImage(named: "sherman.jpg")
  
  let images: [UIImage] = [
    UIImage(named: "sherman.jpg")!,
    UIImage(named: "kam.jpg")!,
    UIImage(named: "bruce.jpg")!,
    UIImage(named: "clint.jpeg")!,
    UIImage(named: "russell.png")!,
  ]
  
  var people = [Person]()
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let peopleFromArchive = self.loadFromArchive() {
      people = peopleFromArchive
    } else {
      for counter in 0 ... (firstNames.count - 1) {
        let personName = Person(fName: "\(firstNames[counter])", lName: "\(lastNames[counter])")
        personName.image = images[counter]
        people.append(personName)
      }
      saveToArchive()
    }

    
    tableView.dataSource = self
    
  }
  
  override func viewWillAppear(animated: Bool) {
    tableView.reloadData()
    saveToArchive()
  }
  
  
  // Segue and passing full name to detail page
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowPersonDetail" {
      if let destinationViewController = segue.destinationViewController as? PersonDetailViewController {
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
          
          let selectedRow = selectedIndexPath.row
          let firstName = firstNames[selectedRow]
          let lastName = lastNames[selectedRow]
          let image = images[selectedRow]
          let selectedPerson = people[selectedRow]
          
          destinationViewController.firstName = firstName
          destinationViewController.lastName = lastName
          destinationViewController.image = image
          destinationViewController.selectedPerson = selectedPerson

        }
      
      }
      
    }
  }
  
  
  // Display cells with full names
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    //part 1 - dequeue the cell
    let cell = tableView.dequeueReusableCellWithIdentifier("PersonCell", forIndexPath: indexPath) as! PersonTableViewCell
    
    //part 2 - configure the cell
    let personCell = people[indexPath.row]
    
    
    //part 3 - return the cell
    
    cell.firstNameLabel.text = personCell.firstName
    cell.lastNameLabel.text = personCell.lastName
    cell.personImageView.image = personCell.image
    
    return cell
  }
  
  func saveToArchive() {
    if let documentPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last {
      
      NSKeyedArchiver.archiveRootObject(people, toFile: documentPath + "/archive")
    }
  }
  
  func loadFromArchive() -> [Person]? {
    if let documentPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last {
      
      if let people = NSKeyedUnarchiver.unarchiveObjectWithFile(documentPath + "/archive") as? [Person] {
        return people
      }
    }
    return nil
  }
  
}
