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
        NavigationStack{
            VStack{
                //List
                List{
                    ForEach (items) { item in
                        
                        HStack{
                            Text(item.title)
                            Spacer()
                            Button{
                                if(item.isComplete){
                                    item.isComplete = false
                                }
                                else {
                                    item.isComplete = true
                                }
                            } label: {
                                if(item.isComplete){
                                    Image(systemName: "checkmark.square.fill").foregroundStyle(.green)
                                }
                                else {
                                    Image(systemName: "square").foregroundStyle(.orange)
                                }
                            }
                        }.padding()
                        
                    }.onDelete{ indexes in
                        for index in indexes{
                            deleteItem(items[index])
                        }
                        
                    }
                }
                
                //Button
                Button("Add a Task!", systemImage: "plus.square"){
                    showingSheet = true
                }
                .foregroundStyle(.purple)
                .sheet(isPresented: $showingSheet){
                    CreateTodoView()
                        .presentationDetents([.fraction(0.3)])
                        .presentationDragIndicator(.visible)
                }
            }.padding()
            .navigationTitle("ToDo")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                }
        }
    }
    
    func deleteItem(_ item: TodoItem){
        context.delete(item)
    }
        
}

#Preview {
    TodoView()
}
