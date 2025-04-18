//
//  Untitled.swift
//  ThanksBunny
//
//  Created by 박민아 on 4/17/25.
//

import SwiftUI

struct SplashView: View {
    // 이미지 전환을 위한 상태 변수
    @State private var showMouth = false
    
    var body: some View {
        Image(showMouth ? "MainBunny" : "BunnyEyesOnly")
            .resizable()
            .scaledToFit()
            .frame(height: 240)
            .animation(.easeInOut(duration: 0.5), value: showMouth)
            .padding()
            .onAppear {
                // 타이머 설정: 1초 후에 이미지 변경
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    showMouth = true}
            }
    }
}

#Preview {
    SplashView()
}
