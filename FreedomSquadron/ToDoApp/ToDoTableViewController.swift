//
//  ToDoTableViewController.swift
//  ToDoApp
//
//  Created by Apple Device 18 on 11/2/19.
//  Copyright © 2019 Tonipocket. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        ToDos = ToDo.generateToDos()
    }
    
    var ToDos = [ToDo]()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return ToDos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Pendientes", for: indexPath)
        let pendiente = ToDos[indexPath.row]
        cell.textLabel?.text="\(pendiente.title)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ToDos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
    }
    
    @IBAction func unWindToViewController(_ segue: UIStoryboardSegue) {
        
        if segue.identifier == "Save"{
            let sourceVC = segue.source as! ToDoViewController
            
            guard let toDo = sourceVC.todo else {return}
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                ToDos[selectedIndexPath.row] = toDo
                tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
            }
            else{
                let newIndexPath = IndexPath(row:ToDos.count, section:0)
                ToDos.append(toDo)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        
    
        
    }
    
}
