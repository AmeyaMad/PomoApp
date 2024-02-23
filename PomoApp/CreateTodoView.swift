//
//  CreateTodoView.swift
//  PomoApp
//
//  Created by Ameya Madhugiri on 2/21/24.
//

import SwiftUI
import SwiftData

struct CreateTodoView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var name: String
    @State private var finishBy: Date
    @State private var priority: Int
    
    
    init(name: String = "", finishBy: Date = Date(), priority: Int = 1) {
          _name = State(initialValue: name)
          _finishBy = State(initialValue: finishBy)
          _priority = State(initialValue: priority)
      }
    
    var body: some View {
        VStack{
            TextField("Name", text: $name)
                .font(.title)
            DatePicker("Finish by?", selection: $finishBy)
                .padding(.bottom)
                .bold()
            HStack{
                Menu("Priority?"){
                    Button("low", systemImage: "exclamationmark.triangle.fill"){
                        priority = 1
                    }
                    Button("med", systemImage: "exclamationmark.triangle.fill"){
                        priority = 2
                    }
                    Button("high", systemImage: "exclamationmark.triangle.fill"){
                        priority = 3
                    }
                }.bold()
                Spacer()
            }
            Label("Create", systemImage: "plus.app")
                .padding()
                .font(.title)
                .foregroundStyle(.green)
                .onTapGesture {
                addItem(name: name, finishBy: finishBy, priority: priority)
                dismiss()
            }
        }.padding(30)

    }
    
    func addItem(name: String, finishBy: Date, priority: Int){
        let item = TodoItem(title: name, dueDate: finishBy, priority: priority, isComplete: false)
        context.insert(item)
    }
    
}


