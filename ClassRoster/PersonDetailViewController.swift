//
//  PersonDetailViewController.swift
//  ClassRoster
//
//  Created by Jonathan W Young on 2/26/15.
//  Copyright (c) 2015 Jonathan W Young. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    @IBOutlet weak var firstNameLabel: UITextField!
    
    @IBOutlet weak var lastNameLabel: UITextField!
    var selectedPerson = Person(fName: "Walter", lName: "Young")
    
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedPerson.fullName()
        self.firstNameLabel.delegate = self
        self.lastNameLabel.delegate = self
        
        if self.selectedPerson.image != nil {
            self.imageView.image = self.selectedPerson.image
        }
        
        
        self.firstNameLabel.text = selectedPerson.firstName
        self.lastNameLabel.text = self.selectedPerson.lastName
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {

        super.viewWillDisappear(animated)
        self.selectedPerson.firstName = self.firstNameLabel.text
        self.selectedPerson.lastName = self.lastNameLabel.text
        self.selectedPerson.image = self.imageView.image
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [NSObject : AnyObject]){
            let image = info[UIImagePickerControllerOriginalImage] as UIImage;
            self.imageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
        
           // var img : UIImage = info[UIImagePickerControllerOriginalImage]
            
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func choosePhoto(sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        }
        else{
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }

        
        imagePicker.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
        imagePicker.delegate = self
        self.presentViewController(imagePicker, animated: true, completion: nil)
        //self.presentModalViewController(imagePicker, animated: true)
    }

}
