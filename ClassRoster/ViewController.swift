//
//  ViewController.swift
//  ClassRoster
//
//  Created by Jonathan W Young on 2/17/15.
//  Copyright (c) 2015 Jonathan W Young. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var tableView: UITableView!
  
    let snacks = ["Apple","Banana","Cheese","Doughnut","Eclair"]
    var people = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let count = userDefaults.objectForKey("launchCount") as? Int {
            userDefaults.setObject((count + 1), forKey: "launchCount")
            self.loadFromArchive()
        }
        else{
            userDefaults.setObject(1, forKey: "launchCount")
        }
        
        
        self.title = "Home"
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
        
        if self.people.isEmpty{
            if let filePath = NSBundle.mainBundle().pathForResource("people", ofType: "plist"){
                if let plistArray = NSArray(contentsOfFile: filePath){
                    println(plistArray.count)
                    
                    for peopleObject in plistArray{
                        if let personDict = peopleObject as? NSDictionary{
                            let firstName = personDict["FirstName"] as String
                            let lastName = personDict["LastName"] as String
                            let addMe = Person(fName: firstName, lName: lastName)
                            people.append(addMe)
                        }
                    }
                    
                    
                }
                
            }
            self.saveToArchive()
        }
        
         println("viewDidLoad")

        self.saveToArchive()
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // send data to next view controller
        if segue.identifier == "ShowGreen"{
            let destinationVC = segue.destinationViewController as PersonDetailViewController
            destinationVC.title = "Hey!"
            
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            destinationVC.selectedPerson = self.people[selectedIndexPath!.row]
            
        }
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.saveToArchive()
        tableView.reloadData()
        println("viewWillAppear")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("viewDidAppear")
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        println(indexPath.row)
//        
//        let myViewController = UIViewController()
//        myViewController.view.backgroundColor = UIColor.greenColor()
//        self.navigationController?.pushViewController(myViewController, animated: true)
//    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as PersonCell
            //cell.backgroundColor = UIColor.blueColor()
            cell.personLabel.text = people[indexPath.row].fullName()
            if people[indexPath.row].image != nil {
                cell.personImage?.image = people[indexPath.row].image
            }
            //cell.textLabel?.text = people[indexPath.row].fullName()
            return cell
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int{
            return self.people.count
            
    }

    func saveToArchive(){
        let archivePath = self.getDocumentsPath()
        NSKeyedArchiver.archiveRootObject(self.people, toFile: archivePath + "archive")
        
        
    }
    
    func loadFromArchive(){
        let archivePath = self.getDocumentsPath()
        let arrayFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath + "archive") as [Person]
        self.people = arrayFromArchive
        
    }
    
    func getDocumentsPath() -> String{
        let documentsPaths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        
        return documentsPaths.first as String
    }

}

