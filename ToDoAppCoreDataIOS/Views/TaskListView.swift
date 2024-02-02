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
    
    init(title: String) {
        self.title = title
        
        let request = CDTask.fetch()
        
        self._tasks = FetchRequest(fetchRequest: request, animation: .bouncy)
    }
    
    var body: some View {
        List(tasks) { task in
            TaskRowView(task: task)
        }
    }
}

#Preview {
    TaskListView(title: "All")
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
