//
//  PomoAppApp.swift
//  PomoApp
//
//  Created by Ameya Madhugiri on 2/15/24.
//

import SwiftUI
import SwiftData

@main
struct PomoAppApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .modelContainer(for: TodoItem.self)
        }
    }
}
