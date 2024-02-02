//
//  TaskListView.swift
//  ToDoAppCoreDataIOS
//
//  Created by Axedeos Pidtchay on 02.02.2024.
//

import SwiftUI

struct TaskListView: View {
    let title: String
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(fetchRequest: CDTask.fetch(), animation: .bouncy) var tasks
    
    @State private var selectedTask: CDTask? = nil
    @State private var inspectorIsShown: Bool = false
    
    let group: CDTaskGroup?
    
    init(title: String, selection: TaskSection?) {
        self.title = title
        
        let request = CDTask.fetch()
        
        switch selection {
            case .all:
                request.predicate = nil
            case .done:
                request.predicate = NSPredicate(format: "isCompleted == true")
            case .upcoming:
                request.predicate = NSPredicate(format: "isCompleted == false")
            case .list(let group):
                request.predicate = NSPredicate(format: "group == %@", group as CVarArg)
            case nil:
                request.predicate = NSPredicate.none
        }
        
        switch selection {
            case .all, .done, .upcoming:
                group = nil
            case .list(let group):
                self.group = group
            case nil:
                group = nil
        }
        
        self._tasks = FetchRequest(fetchRequest: request, animation: .bouncy)
    }
    
    var body: some View {
        List(tasks) { task in
            TaskRowView(task: task,
                        selectedTask: $selectedTask,
                        inspectorIsShown: $inspectorIsShown)
        }
        .navigationTitle(title)
        .toolbar {
            Button {
                let task = CDTask(title: "New", dueDate: Date(), context: context)
                task.group = group
                PersistenceController.shared.save()
            } label: {
                Label("Add task", systemImage: "plus")
            }
        }
        // TODO аналог inspector для iOS < 17?
        .inspector(isPresented: $inspectorIsShown, content: {
            if let selectedTask {
                TaskDetailView(task: selectedTask)
            } else {
                ContentUnavailableView("Please select a task", systemImage: "circle.inset.filled")
            }
        })
    }
}

#Preview {
    TaskListView(title: "All", selection: .all)
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
