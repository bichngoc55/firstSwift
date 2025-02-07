//
//  TaskListViewModel.swift
//  firstSwift
//
//  Created by Bích Ngọc on 5/2/25.
//

import Foundation

class TaskListViewModel: ObservableObject {
    @Published var tasks: [Task] = []

    func addTask(title: String) {
        let newTask = Task(title: title)
        tasks.append(newTask)
    }

    func toggleTaskCompletion(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle() 
        }
    }
}
