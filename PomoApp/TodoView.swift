//
//  TodoView.swift
//  PomoApp
//
//  Created by Ameya Madhugiri on 2/21/24.
//

import SwiftUI
import SwiftData


struct TodoView: View {
    @State private var showingSheet = false
    
    @Environment(\.modelContext) private var context
    
    @Query private var items: [TodoItem]
    
    var body: some View {
        VStack{
            Button("Add a Task!"){
                showingSheet = true
            }
            .foregroundStyle(.purple)
            .sheet(isPresented: $showingSheet){
                CreateTodoView()
                    .presentationDetents([.fraction(0.3)])
                    .presentationDragIndicator(.visible)
            }
            
            
            List{
                Text("hello")
                ForEach (items) { item in
                    Text(item.title)
                }
            }
        }.padding()
    }
}

#Preview {
    TodoView()
}
