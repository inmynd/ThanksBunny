//
//  HomeView.swift
//  ThanksBunny
//
//  Created by 박민아 on 4/15/25.
//

import SwiftUI

struct HomeView: View {
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateStyle = .long
        return formatter.string(from: Date())
    }
    
    var body: some View {
        VStack(spacing: 0){
                Text(formattedDate)
                    .font(.Bunny(size: 40))
            Spacer().frame(height: 10)
            
            Image("MainBunny")
                .resizable()
                .scaledToFit()
                .frame(height: 250)
            
            Spacer().frame(height: 10)
            
            Text("땡스버니에게\n오늘의 감사한 마음을\n들려주세요")
                .font(.custom("NanumJungHagSaeng", size: 40))
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 40)
            
            HStack {
                CustomButton(
                    icon: "mic",
                    text: "감사말하기"
                ) {
                    print("hi")//나중에 화면연결 누르면 이동
                }
                
                
                CustomButton(
                    icon: "headphones",
                    text: "감사듣기"
                ) {
                    print("hi")//나중에 화면연결 누르면 이동
                }
            }
        }
        
    }
    
}
#Preview {
    
    HomeView()
}

