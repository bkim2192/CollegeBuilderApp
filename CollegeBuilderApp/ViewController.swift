//
//  ViewController.swift
//  CollegeBuilderApp
//
//  Created by Brandon Kim on 10/4/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var colleges:[College] = []
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isEditing = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
           getData()
           tableView.reloadData()
           
       }
       func getData() {
           if let myColleges = try? context.fetch(College.fetchRequest()){
               colleges = myColleges as! [College]
           } else {
               print("error in fetch request")
           }
           
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        colleges.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "* \(colleges[indexPath.row].name!)  "
        cell.detailTextLabel?.text = "At: \(colleges[indexPath.row].location!)"
        cell.detailTextLabel?.textColor = .black
        cell.textLabel?.textColor = .black
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
        
    }

     func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let movedObject = self.colleges[sourceIndexPath.row]
        colleges.remove(at: sourceIndexPath.row)
        colleges.insert(movedObject, at: destinationIndexPath.row)
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let college = colleges[indexPath.row]
            context.delete(college)
         (UIApplication.shared.delegate as! AppDelegate).saveContext()
            getData()
            
        }
        tableView.reloadData()
    }
    
    
}

