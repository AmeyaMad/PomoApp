//
//  RootView.swift
//  PomoApp
//
//  Created by Ameya Madhugiri on 2/21/24.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView{
            MainViewA().tabItem{
                Label("Timer", systemImage: "clock")
            }
            TodoView().tabItem{
                Label("ToDo", systemImage: "checklist")
            }
        }
    }
}

#Preview {
    RootView()
}
