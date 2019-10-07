//
//  SecondViewController.swift
//  CollegeBuilderApp
//
//  Created by Brandon Kim on 10/7/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func save(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
         // allows us to access appDelegate file stuff
         let context = appDelegate.persistentContainer.viewContext
         let college = College(context: context)
         //storing the task into core data
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        // task.dueDate = datePicker.date
         
         
         // task.setValue(textField.text!, forKey : "taskName")
         appDelegate.saveContext()
    }
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
