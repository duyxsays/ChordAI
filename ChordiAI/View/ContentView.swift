//
//  ContentView.swift
//  ChordiAI
//
//  Created by Simon Andersen on 21/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var overlayPoints: [CGPoint] = []
    @StateObject private var chordsManager = ChordsManager()
    
    var body: some View {
        ZStack {
            
            CameraView {
                overlayPoints = $0
                if chordsManager.startPlaying {
                    chordsManager.countFingers($0.count)
                }
            }.overlay(FingersOverlay(with: overlayPoints)
                .foregroundColor(.green))
                .edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Spacer()
                
                Spacer()
                
                Spacer()
                
                Button {
                    
                    chordsManager.startPlaying.toggle()
                    
                } label: {
                    Text(chordsManager.startPlaying ? "End" : "Start")
                        .fontWeight(.bold)
                        .textCase(.uppercase)
                        .foregroundColor(.black)
                        .padding()
                        .padding(.horizontal)
                        .background(Color.gray.opacity(0.4))
                        .clipShape(Capsule())
                }
                
                Spacer()
            }
        }
    }
}
