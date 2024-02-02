//
//  TaskGroupRowView.swift
//  ToDoAppCoreDataIOS
//
//  Created by Axedeos Pidtchay on 02.02.2024.
//

import SwiftUI

struct TaskGroupRowView: View {
    @ObservedObject var taskGroup: CDTaskGroup
        
    var body: some View {
        HStack {
            Image(systemName: "folder")
            TextField("New Group", text: $taskGroup.title)
        }
    }
}

#Preview {
    TaskGroupRowView(taskGroup: CDTaskGroup.example)
}
