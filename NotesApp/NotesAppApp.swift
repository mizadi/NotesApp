//
//  NotesAppApp.swift
//  NotesApp
//
//  Created by Adi Mizrahi on 05/05/2025.
//

import SwiftUI

@main
struct NotesAppApp: App {
    @AppStorage("isDarkMode") private var isDarkMode = false
    @StateObject private var settings = AppSettings()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
            WindowGroup {
                NotesListView()
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
                    .environmentObject(settings)
                    .preferredColorScheme(isDarkMode ? .dark : .light)
            }
        }
}
