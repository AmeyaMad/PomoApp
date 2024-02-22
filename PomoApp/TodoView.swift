//
//  TodoView.swift
//  PomoApp
//
//  Created by Ameya Madhugiri on 2/21/24.
//

import SwiftUI


struct TodoView: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Add a Task!"){
            showingSheet = true
        }
        .foregroundStyle(.purple)
        .sheet(isPresented: $showingSheet){
            CreateTodoView()
                .presentationDetents([.fraction(0.3)])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    TodoView()
}
