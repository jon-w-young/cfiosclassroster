//
//  PersonDetailViewController.swift
//  ClassRoster
//
//  Created by Jonathan W Young on 2/26/15.
//  Copyright (c) 2015 Jonathan W Young. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    var selectedPerson = Person(fName: "Walter", lName: "Young")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedPerson.fullName()
        self.firstNameLabel.text = selectedPerson.firstName
        self.lastNameLabel.text = self.selectedPerson.lastName
        
        
    }

}
