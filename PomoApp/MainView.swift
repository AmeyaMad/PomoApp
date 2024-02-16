//
//  MainView.swift
//  PomoApp
//
//  Created by Ameya Madhugiri on 2/15/24.
//

import SwiftUI

let defaultTimeRemaining: CGFloat = 25
let lineWidth: CGFloat = 30
let radius: CGFloat = UIScreen.main.bounds.height * 0.2
let dynamicSpaceW = UIScreen.main.bounds.width * 0.1
let dynamicSpaceH = UIScreen.main.bounds.width * 0.1

struct MainView: View {
    
    
    @State private var isActive = false
    @State private var timeRemaining: CGFloat = defaultTimeRemaining
    @State private var showingChangeSheet = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: dynamicSpaceH){
            ZStack{
                Circle()
                    .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                
                Circle()
                    .trim(from: 0, 
                          to: 1 - ((defaultTimeRemaining - timeRemaining) / defaultTimeRemaining))
                    .stroke(Color.green, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut, value: isActive)
                Text("\(timeRemaining, specifier: "%.2f")")
                    .font(.largeTitle)
            }.frame(width: radius * 2, height: radius * 2)
        
            
            
            HStack(spacing: dynamicSpaceW){
            label: do {
                    if !isActive{
                        Label("Start", systemImage: "play.fill")
                            .foregroundColor(.green)
                            .font(.largeTitle)
                            .onTapGesture( perform: {
                                isActive = true
                            })
                        
                        Label("Change", systemImage: "timer")
                            .foregroundColor(.orange)
                            .font(.largeTitle)
                            .onTapGesture( perform: {
                                showingChangeSheet = true
                            })
                            .sheet(isPresented: $showingChangeSheet){
                                ChangeSheetView()
                            }
                    }
                    
                    else{
                        Label("Pause", systemImage: "pause.fill")
                            .foregroundColor(.yellow)
                            .font(.largeTitle)
                            .onTapGesture( perform: {
                                
                            })
                        
                        Label("End", systemImage: "stop.fill")
                            .foregroundColor(.red)
                            .font(.largeTitle)
                            .onTapGesture( perform: {
                                isActive = false
                            })
                    }
                    
                    
                }
            
            }
        }.onReceive(timer, perform: { _ in
            guard isActive else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
            else{
                isActive = false
                timeRemaining = defaultTimeRemaining
            }
        })
    }
}


struct ChangeSheetView: View {
    var body: some View {
        // Design your bottom sheet here
        Text("hello")
    }
}
    
    
#Preview {
    MainView()
}
