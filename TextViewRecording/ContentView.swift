//
//  ContentView.swift
//  TextViewRecording
//
//  Created by Nuriansyah Malik on 09/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isStop: Bool = false
    @State private var isPlay: Bool = false
    var body: some View {
        ZStack{
            
                RoundedRectangle(cornerRadius: isStop ? 30  : 5)
                    .frame(width: isStop ? 60 : 250, height: 60)
                    .foregroundColor(isStop ? Color.blue : Color.purple)
                    .overlay {
                        Image(systemName: "mic.fill")
                            .font(.title)
                            .foregroundColor(.white)
                            .scaleEffect(isPlay ? 0.7 : 1)
                        
                    }
                RoundedRectangle(cornerRadius: isStop ? 35 : 10)
                    .trim(from: 0, to: isStop ? 0.0001 : 1)
                    .stroke(lineWidth: 5)
                    .frame(width: isStop ? 70 : 260, height: 70)
                    .foregroundColor(.purple)
            }
        .padding(EdgeInsets(top: 12, leading: 12, bottom: 120, trailing: 12))
        .overlay{
            if isPlay{
                RecordingProgress()
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .onTapGesture {
            withAnimation(Animation.spring()){
                isStop.toggle()
            }
            withAnimation(Animation.spring().repeatForever().delay(0.5)) {
                isPlay.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RecordingProgress: View{
    @State private var isProgressLoading: Bool = false
    var body: some View{
        HStack{
            Text("Recording...")
                .frame(width: 100, height: 20)
                .scaleEffect(isProgressLoading ? 0 : 1)
                .animation(.linear(duration: 2.1).repeatForever().delay(0.8), value: isProgressLoading)
                .onAppear{
                    isProgressLoading = true
                }
        }.padding(.vertical, 8)
    }
}
