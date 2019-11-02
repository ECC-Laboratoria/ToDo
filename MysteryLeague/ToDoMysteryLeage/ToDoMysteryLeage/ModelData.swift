//
//  ModelData.swift
//  ToDoMysteryLeage
//
//  Created by Diana Arana on 02/11/19.
//  Copyright © 2019 Diana Arana. All rights reserved.
//

import UIKit

struct ToDo {
    var title: String
    var isCompleted: Bool
    var dueDate: Date
    var note: String?

    static func loadToDos() -> [ToDo]? {
        return nil
    }
    
    static func generateToDos() -> [ToDo] {
        return [
            ToDo(title: "Primer ToDo", isCompleted: false, dueDate: Date(), note: "some notes"),
            ToDo(title: "Segundo ToDo", isCompleted: false, dueDate: Date(), note: "some notes"),
            ToDo(title: "Tercer ToDo", isCompleted: false, dueDate: Date(), note: "some notes")
        ]
    }
}

