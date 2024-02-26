//
//  PomoAppMenuBarApp.swift
//  PomoAppMenuBar
//
//  Created by Ameya Madhugiri on 2/24/24.
//

import SwiftUI

@main
struct PomoAppMenuBarApp: App {
    var body: some Scene {
        MenuBarExtra("PomoBar", systemImage: "hand.thumbsup.fill"){
            MenuBarMainView().frame(width: 350, height: 400)
        }.menuBarExtraStyle(.window)
            
    }
}
