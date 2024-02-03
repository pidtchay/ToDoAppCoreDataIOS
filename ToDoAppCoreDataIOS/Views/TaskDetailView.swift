//
//  TaskDetailView.swift
//  ToDoAppCoreDataIOS
//
//  Created by Axedeos Pidtchay on 02.02.2024.
//

import SwiftUI

struct TaskDetailView: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var task: CDTask
    
    var body: some View {
        List {
            Text(task.title)
                .font(.title3)
                .bold()
            
            Toggle(task.isCompleted ? "Completed" : "Open",
                   isOn: $task.isCompleted)
            
            DatePicker("Due Date", selection: $task.dueDate)
            
            Section("Sub Tasks") {
                ForEach(task.subTasks.sorted()) { subtask in
                   TaskRowView(task: subtask,
                           selectedTask: .constant(nil),
                           inspectorIsShown: .constant(false),
                           showMoreButton: false)
                }
                
                Button(action: {
                    let subTask = CDTask(title: "", dueDate: Date(), context: context)
                    subTask.parentTask = task
                    
                }, label: {
                    Label("New Sub Task", systemImage: "plus.circle")
                })
            }
        }
        .listStyle(.sidebar)
    }
}

#Preview {
    TaskDetailView(task: CDTask.example)
}
