//
//  MainViewA.swift
//  PomoApp
//
//  Created by Ameya Madhugiri on 2/15/24.
//

import SwiftUI
let radius: CGFloat = UIScreen.main.bounds.height * 0.3
let lineWidth: CGFloat = 30

struct MainViewA: View {
    @StateObject private var vm = ViewModel()
    @State public var showingSheet = false
    @State private var mode: String = "Focus"
    @State private var image: String = "brain.filled.head.profile"
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 250
    
    
    
    
    var body: some View {
        VStack(spacing: UIScreen.main.bounds.height * 0.15){
            Label(mode, systemImage: image)
                .font(.title)
                .bold()
            
            ZStack{
                Circle()
                    .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                
                Circle()
                    .trim(from: (vm.elapsedSeconds/vm.totalSeconds),
                          to: 1)
                    .stroke(Color.green, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeInOut, value: vm.isActive)
            
                Text("\(vm.time)")
                    .font(.largeTitle)
                    .padding()
                    .frame(width: width)
                    .alert("Timer Done!", isPresented: $vm.showingAlert) {
                        Button("Continue", role: .cancel){
                            vm.runCount += 1
                            if vm.runCount < 6 && vm.runCount % 2 == 1{
                                vm.minutes = 25
                                mode = "Focus"
                                image = "brain.filled.head.profile"
                            }
                            
                            else if vm.runCount < 6 {
                                vm.minutes = 5
                                mode = "Break"
                                image = "flag.checkered"
                            }
                            
                            else{
                                mode = "Long Break"
                                image = "flag.checkered.2.crossed"
                                vm.minutes = 20
                                vm.runCount = 1
                            }
                        }
                    }
            }.frame( width: radius, height: radius)
            
            
            HStack {
            label: do {
                if !vm.isActive{
                    Label("Start", systemImage: "play.fill")
                        .foregroundColor(.green)
                        .font(.largeTitle)
                        .onTapGesture( perform: {
                            vm.start(minutes: vm.minutes)
                        }).padding()
                    
                    Label("Change", systemImage: "timer")
                        .foregroundColor(.orange)
                        .font(.largeTitle)
                        .onTapGesture( perform: {
                            showingSheet.toggle()
                        })
                        .sheet(isPresented: $showingSheet){
                            ChangeSheetViewA(vm: vm, showingSheet: $showingSheet)
                        }.padding()
                    
                }
                
                else{
                    
                    Label("End", systemImage: "stop.fill")
                        .foregroundColor(.red)
                        .font(.largeTitle)
                        .onTapGesture( perform: {
                            vm.isActive = false
                            vm.reset()
                        }).padding()
                }
            }
                
            }
        }.onReceive(timer) { _ in
            vm.updateCountdown()
        }
    }
}

struct ChangeSheetViewA: View {
    @ObservedObject var vm: ViewModel
    @Binding var showingSheet: Bool

    var body: some View {
        VStack{
            Text("Choose how long you'd like to focus for!")
                .padding()
                .padding()
                .font(.title)
                .bold()
                .multilineTextAlignment(.center)
        
            Label("\(vm.time)", systemImage: "clock.arrow.2.circlepath")
                .font(.largeTitle)
                .padding()
            Slider(value: $vm.minutes, in: 0...60, step: 5)
                .padding()
                .frame(width: 300)
                .animation(.easeInOut, value: vm.minutes)
            
            Label("Set Time", systemImage: "checkmark.circle.fill")
                .font(.title)
                .foregroundStyle(.green)
                .padding()
                .onTapGesture(perform: {
                    self.showingSheet = false
                })
                
        }
    }
       
}



#Preview {
    MainViewA()
}
