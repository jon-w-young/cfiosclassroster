//
//  Person.swift
//  ClassRoster
//
//  Created by Jonathan W Young on 2/19/15.
//  Copyright (c) 2015 Jonathan W Young. All rights reserved.
//

import UIKit

class Person : NSObject, NSCoding {
    var firstName = "John";
    var lastName = "Doe";
    var image : UIImage?
    
    init(fName : String, lName : String){
        self.firstName = fName;
        self.lastName = lName;
    }
    
    func fullName() ->String{
        return self.firstName + " " + self.lastName
    }
    
    required init(coder aDecoder: NSCoder){
        self.firstName = aDecoder.decodeObjectForKey("firstName") as String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as String
        self.image = aDecoder.decodeObjectForKey("image") as? UIImage
    }
    
    func encodeWithCoder(aDecoder: NSCoder){
        aDecoder.encodeObject(self.firstName, forKey: "firstName")
        aDecoder.encodeObject(self.lastName, forKey: "lastName")
        if(self.image != nil){
            aDecoder.encodeObject(self.image, forKey: "image")
        }
        
    }
    
    
}
