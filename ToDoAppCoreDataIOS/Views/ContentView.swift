//
//  ContentView.swift
//  ToDoAppCoreDataIOS
//
//  Created by Axedeos Pidtchay on 02.02.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var selection: TaskSection? = TaskSection.initialValue

    var body: some View {
        NavigationSplitView {
            SidebarView(selection: $selection)
        } detail: {
            TaskListView(title: "All")
        }
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
