//
//  SidebarView.swift
//  ToDoAppCoreDataIOS
//
//  Created by Axedeos Pidtchay on 02.02.2024.
//

import SwiftUI

struct SidebarView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(fetchRequest: CDTaskGroup.fetch(), animation: .bouncy)
    var taskGroups: FetchedResults<CDTaskGroup>
    
    @Binding var selection: TaskSection?
    
    var body: some View {
        List(selection: $selection) {
            Section("Favorites") {
                ForEach(TaskSection.allCases) { selection in
                    Label(selection.displayName,
                          systemImage: selection.iconName)
                    .tag(selection)
                }
            }
            
            Section("Your Groups") {
                ForEach(taskGroups) { group in
                    TaskGroupRowView(taskGroup: group)
                        .tag(TaskSection.list(group))
                }
            }
        }
        .safeAreaInset(edge: .bottom) {
            Button(action: {
                let newGroup = CDTaskGroup(title: "New", context: context)
              
            }, label: {
                Label("Add Group", systemImage: "plus.circle")
            })
        }
    }
}

#Preview {
    SidebarView(selection: .constant(.all))
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
