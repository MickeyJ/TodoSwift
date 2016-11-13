//
//  ViewController.swift
//  DoIt
//
//  Created by Michael Malotte on 11/13/16.
//  Copyright © 2016 Michael Malotte. All rights reserved.
//

import UIKit

class TaskListVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks: Array<Task> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeTasks()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @IBAction func onEditPress(_ sender: Any) {
        
        performSegue(withIdentifier: "NewTask", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! NewTaskVC
        
        nextVC.previousVC = self
        
    }

}

extension TaskListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell: TodoCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as? TodoCell {
            
            let task = tasks[indexPath.row]
            cell.taskTitle?.text = task.important ? "\(task.name)❗️" : task.name
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.reloadData()
        }
        
    }
    
    func makeTasks() {
        tasks.append( Task(name: "Make Things and Stuff", important: true) )
        tasks.append( Task(name: "Clean", important: false) )
        tasks.append( Task(name: "Sleep", important: false) )
    }
    
}

