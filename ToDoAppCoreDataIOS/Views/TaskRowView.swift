//
//  TaskRowView.swift
//  ToDoAppCoreDataIOS
//
//  Created by Axedeos Pidtchay on 02.02.2024.
//

import SwiftUI

struct TaskRowView: View {
    @ObservedObject var task: CDTask
    @Binding var selectedTask: CDTask?
    @Binding var inspectorIsShown: Bool
    
    let showMoreButton: Bool
    
    init(task: CDTask,
         selectedTask: Binding<CDTask?>,
         inspectorIsShown: Binding<Bool>,
         showMoreButton: Bool = true) {
        self.task = task
        self._selectedTask = selectedTask
        self._inspectorIsShown = inspectorIsShown
        self.showMoreButton = showMoreButton
    }
    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            
            TextField("New Task", text: $task.title)
                .textFieldStyle(.plain)
            
            Button(action: {
                inspectorIsShown = true
                selectedTask = task
            }, label: {
                Text("More")
            })
        }
    }
}

#Preview {
    TaskRowView(task: CDTask.example,
                selectedTask: .constant(nil),
                inspectorIsShown: .constant(false))
    .padding()
}
