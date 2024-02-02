//
//  ToDoAppCoreDataIOSApp.swift
//  ToDoAppCoreDataIOS
//
//  Created by Axedeos Pidtchay on 02.02.2024.
//

import SwiftUI

@main
struct ToDoAppCoreDataIOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
