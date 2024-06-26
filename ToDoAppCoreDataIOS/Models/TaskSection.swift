//
//  TaskSection.swift
//  ToDoAppCoreDataIOS
//
//  Created by Axedeos Pidtchay on 02.02.2024.
//

import Foundation

enum TaskSection: Identifiable, CaseIterable, Hashable {
    
    case all
    case done
    case upcoming
    case list(CDTaskGroup)
    
    var id: String {
        switch self {
            case .all:
                "all"
            case .done:
                "done"
            case .upcoming:
                "upcoming"
            case .list(let taskGroup):
                taskGroup.uuid.uuidString
        }
    }
    
    var displayName: String {
        switch self {
            case .all:
                "All"
            case .done:
                "Done"
            case .upcoming:
                "Upcoming"
            case .list(let taskGroup):
                taskGroup.title
        }
    }
    
    var iconName: String {
        switch self {
            case .all:
                "star"
            case .done:
                "checkmark.circle"
            case .upcoming:
                "calendar"
            case .list(_):
                "folder"
        }
    }
    
    static var allCases: [TaskSection] {
        [.all, .done, .upcoming]
    }
    
    static func == (lhs: TaskSection, rhs: TaskSection) -> Bool {
        lhs.id == rhs.id
    }
    
    static var initialValue: TaskSection? {
        TaskSection.all
    }
}
