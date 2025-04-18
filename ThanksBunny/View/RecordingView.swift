//
//  RecordingView.swift
//  ThanksBunny
//
//  Created by 박민아 on 4/18/25.
//

import SwiftUI

struct RecordingView: View {
    @State private var title: String = ""
    @State private var isRecorded: Bool = false
    @StateObject private var recorder = AudioRecorderManager()
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image(systemName: "heart")
                    .imageScale(.large)
                    .foregroundColor(.black)
                    .padding(.leading, 60)
                TextField("감사 키워드를 입력해주세요", text: $title)
                    .font(.Bunny(size: 30))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
                Image(systemName: "heart")
                    .imageScale(.large)
                    .foregroundColor(.black)
                .padding(.trailing, 60)}
            Spacer().frame(height: 10)
            //여기까지 감사키워드 내용
            //여기에 녹음 타이머 들어가야함
            Image(isRecorded ? "BunnyMouse" : "MainBunny")
                .resizable()
                .scaledToFit()
                .frame(height: 210)
            Spacer().frame(height: 10)
            CustomButton(
                icon: recorder.isRecording ? "stop.circle" : "record.circle",
                text: recorder.isRecording ? "정지하기" : "녹음하기"
            ) {
                if recorder.isRecording {
                    recorder.stopRecording()
                    withAnimation {
                        isRecorded = true
                    }
                }else {
                    recorder.startRecording()
                }
            }
            Spacer().frame(height: 50)
            LongButton(text: "감사기록 저장하기",
                       action: {
                print("LongButton")
            }, isEnabled: !title.isEmpty && isRecorded)
            .padding(.horizontal, 30)
        }
    }
}
    #Preview {
        RecordingView()
    }

