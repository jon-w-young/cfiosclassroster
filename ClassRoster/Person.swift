//
//  Person.swift
//  ClassRoster
//
//  Created by Jonathan W Young on 2/19/15.
//  Copyright (c) 2015 Jonathan W Young. All rights reserved.
//

import Foundation

class Person {
    let firstName = "John";
    let lastName = "Doe";
    
    init(fName : String, lName : String){
        self.firstName = fName;
        self.lastName = lName;
    }
    
    func fullName() ->String{
        return self.firstName + " " + self.lastName
    }
}
