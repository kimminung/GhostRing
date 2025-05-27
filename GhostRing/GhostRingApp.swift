//
//  GhostRingApp.swift
//  GhostRing
//
//  Created by coulson on 4/13/25.
//

import SwiftUI
import SwiftData

@main
struct GhostRingApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            GRModel.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            GRLaunchScreenView()
        }
        .modelContainer(sharedModelContainer)
    }
}
