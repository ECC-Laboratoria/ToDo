//
//  ToDoViewController.swift
//  ToDoMysteryLeage
//
//  Created by Diana Arana on 09/11/19.
//  Copyright © 2019 Diana Arana. All rights reserved.
//

import UIKit

class ToDoViewController : UITableViewController {
    
    @IBOutlet weak var check: UIButton!
    
    @IBOutlet weak var Save: UIBarButtonItem!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var ToDoTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        enableSaveButton()
        sendDate(datePicker.date)
    }
    

    @IBAction func textEditingChanged(_ sender: UITextField) {
        enableSaveButton()

    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        ToDoTextField.resignFirstResponder()
    }
    
    @IBAction func datePickerChange(_ sender: Any) {
        sendDate(datePicker.date)
    }
    
    func enableSaveButton() {
        if ((ToDoTextField.text?.isEmpty)!) {
            Save.isEnabled = false
        }else {
            Save.isEnabled = true
        }
    }
    
    @IBAction func checkComplete(_ sender: UIButton) {
        check.isSelected = !check.isSelected
    }
    

    

    
    func sendDate(_ date: Date) {
        dateLabel.text = ToDo.dueDateFormatter.string(from: date)
        
    }
    
    var isPickerHidden = true
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let normalCellHeight = CGFloat(44)
        let largeCellHeight = CGFloat(200)
        
        switch indexPath {
        case [1,0]:
            return isPickerHidden ? normalCellHeight:largeCellHeight
        case [2,0]:
            return largeCellHeight
        default:
            return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath) {
        case [1,0]:
            isPickerHidden = !isPickerHidden
            print(isPickerHidden)
            
            dateLabel.textColor = isPickerHidden ? .black : tableView.tintColor
            
            tableView.beginUpdates()
            tableView.endUpdates()
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "SaveUnwind" else {return}
        
        let title = ToDoTextField.text!
        let isComplete = check.isSelected
        let dueDate = datePicker.date
        let notes = notesTextView.text
        
        var todo = ToDo(title: title, isCompleted: isComplete, dueDate: dueDate, note: notes )
    }
    
}
