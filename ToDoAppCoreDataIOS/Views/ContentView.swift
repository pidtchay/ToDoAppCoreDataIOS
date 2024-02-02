//
//  ContentView.swift
//  ToDoAppCoreDataIOS
//
//  Created by Axedeos Pidtchay on 02.02.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        Text("Helo")
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
