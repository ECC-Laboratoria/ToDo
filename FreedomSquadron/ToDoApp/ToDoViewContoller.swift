//
//  ToDoViewContoller.swift
//  ToDoApp
//
//  Created by Apple Device 3 on 11/9/19.
//  Copyright © 2019 Tonipocket. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController{
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var dateDatePricker: UIDatePicker!
    @IBOutlet weak var BasicInfoTextField: UITextField!
    @IBOutlet weak var isCompletedButton: UIButton!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var todo: ToDo?
    
    @IBAction func returnPressed(_ sender: UITextField) {
        BasicInfoTextField.resignFirstResponder()
    }
    
    
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        textFieldDidChange(textField: BasicInfoTextField)
    }
    
    
    
    @IBAction func changedStatus(_ sender: UIButton) {
        isCompletedButton.isSelected = !isCompletedButton.isSelected
    }
    
    
    
    @IBAction func getDate(_ sender: UIDatePicker) {
        updateDate(date: dateDatePricker.date)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldDidChange(textField: BasicInfoTextField)
        updateDate(date: dateDatePricker.date)
    }
    
    func textFieldDidChange(textField:UITextField){
        if (BasicInfoTextField.text?.isEmpty)! {
            saveButton.isEnabled = false
        }else{
            saveButton.isEnabled = true
        }
    }
    
    
    func updateDate(date:Date){
        dateLabel.text = ToDo.dueDateFormatter.string(from: date)
    }
    
    
    var isPickerHidden:Bool = false
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let normalCellHeight = CGFloat(44)
        let largeCellHeigth = CGFloat(200)
        
        
        switch indexPath {
        case [1,0]:
            return isPickerHidden ? normalCellHeight:largeCellHeigth
        case [2,0]:
            return largeCellHeigth
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
        
        guard segue.identifier == "Save" else {return}
        
        let title = BasicInfoTextField.text!
        let isComplete = isCompletedButton.isSelected
        let dueDate = dateDatePricker.date
        let notes = descriptionTextField.text
        
        todo = ToDo(title: title, isCompleted:  isComplete, dueDate: dueDate, notes: notes ?? "")
    }
    
}


    


