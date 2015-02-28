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
        self.title = "Home"
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
        
        people.append(Person(fName: "Al", lName: "Albertson"))
        people.append(Person(fName: "Ben", lName: "Benson"))
        people.append(Person(fName: "Charles", lName: "Charleston"))
        people.append(Person(fName: "Donald", lName: "Donaldson"))
        people.append(Person(fName: "Eric", lName: "Ericson"))
        people.append(Person(fName: "Frank", lName: "Frankenstein"))

        
         println("viewDidLoad")
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
            let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
            //cell.backgroundColor = UIColor.blueColor()
            cell.textLabel?.text = people[indexPath.row].fullName()
            return cell
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int{
            return self.people.count
            
    }

    

}

