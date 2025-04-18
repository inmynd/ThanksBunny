//
//  ContentView.swift
//  ThanksBunny
//
//  Created by 박민아 on 4/15/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("MainBunny")
                .resizable()
                .scaledToFit()
                .frame(height: 240)
            Text("땡스버니")
                .font(.Bunny(size: 50))
                .foregroundStyle(Color.black)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
// 여기까지 스플래시 이미지
// 시간이 지나면 이미지가 지나는 방법! timer 활용해보세용
