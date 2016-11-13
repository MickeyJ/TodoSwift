//
//  NewTaskVC.swift
//  DoIt
//
//  Created by Michael Malotte on 11/13/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import UIKit

class NewTaskVC: UIViewController {
    
    @IBOutlet weak var newTaskName: UITextField!
    @IBOutlet weak var newTaskImportant: UISwitch!
    
    var previousVC = TaskListVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addNewTask(_ sender: Any) {
        
        if let taskName: String = newTaskName.text , newTaskName.text != "" {
            
            let newTask = Task(name: taskName.capitalized, important: newTaskImportant.isOn)
            
            previousVC.tasks.append(newTask)
            previousVC.tableView.reloadData()
            
            navigationController!.popViewController(animated: true)
            
        }
        
        
    }
    

}
