//
//  CreateTodoView.swift
//  PomoApp
//
//  Created by Ameya Madhugiri on 2/21/24.
//

import SwiftUI

struct CreateTodoView: View {
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            TextField("Name", text: .constant(""))
                .font(.title)
            DatePicker("Finish by?", selection: .constant(.now))
                .padding(.bottom)
                .bold()
            HStack{
                Menu("Priority?"){
                    Label("low", systemImage: "exclamationmark.triangle.fill")
                    Label("med", systemImage: "exclamationmark.triangle.fill")
                    Label("hi", systemImage: "exclamationmark.triangle.fill")
                }.bold()
                Spacer()
            }
            Label("Create", systemImage: "plus.app")
                .padding()
                .font(.title)
                .foregroundStyle(.green)
                .onTapGesture {
                dismiss()
            }
        }.padding(30)

    }
}

#Preview {
    CreateTodoView()
}
