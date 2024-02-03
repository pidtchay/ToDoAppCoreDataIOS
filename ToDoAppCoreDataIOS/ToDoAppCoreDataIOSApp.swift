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
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onChange(of: scenePhase) { oldValue, newValue in
                    if newValue == .background {
                        persistenceController.save()
                    }
                }
        }
    }
}
