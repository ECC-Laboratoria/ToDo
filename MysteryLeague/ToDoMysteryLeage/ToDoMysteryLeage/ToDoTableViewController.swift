//
//  TableViewController.swift
//  ToDoMysteryLeage
//
//  Created by Diana Arana on 02/11/19.
//  Copyright © 2019 Diana Arana. All rights reserved.
//

import UIKit



class ToDoTableViewController: UITableViewController {
    
    var toDo = [ToDo] ()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDo = ToDo.generateToDos()
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDo.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //definir celda
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath)
        
        //contenido celda
        cell.textLabel?.text = "\(toDo[indexPath.row].title)"
        return cell
        
        
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let taskToMove = toDo.remove(at: sourceIndexPath.row)
        toDo.insert(taskToMove, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDo.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
        }
        
        
        
       
    }
    
    @IBAction func regresaAVistaPrincipal(_ unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "SaveUnwind" {
            let sourceVC = unwindSegue.source as! ToDoViewController
            guard let task = sourceVC.ToDoTextField else {return}
//
//            if let selectedIndexPath = tableView.indexPathForSelectedRow {
//                toDo[selectedIndexPath.row] = task
//                tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
//            }
//            else {
//                let newIndexPath = IndexPath(row: toDo.count, section: 0)
//                toDo.append(task)
//                tableView.insertRows(at: [newIndexPath], with: .automatic)
//            }
//       
        }
    }
    
    
}







//if unwindSegue.identifier == "unwindToEmojiTableVC" {
//    let sourceVC = unwindSegue.source as! AddEditTableViewController
//    guard let emoji = sourceVC.emoji else {return}
//
//    if let selectedIndexPath = tableView.indexPathForSelectedRow {
//        emojis[selectedIndexPath.row] = emoji
//        tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
//    }
//    else {
//        let newIndexPath = IndexPath(row: emojis.count, section: 0)
//        emojis.append(emoji)
//        tableView.insertRows(at: [newIndexPath], with: .automatic)
//}
