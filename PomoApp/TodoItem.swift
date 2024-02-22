//
//  TodoItem.swift
//  PomoApp
//
//  Created by Ameya Madhugiri on 2/21/24.
//

import Foundation
import SwiftData

@Model
final class TodoItem {
    var title: String
    var dueDate: Date
    var priority: Int
    var isComplete: Bool
    
    init(title: String = "", dueDate: Date = .now,priority: Int = 2, isComplete: Bool = false){
        self.title = title
        self.dueDate = dueDate
        self.priority = priority
        self.isComplete = isComplete
    }
}
