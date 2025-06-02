//
//  HomeView.swift
//  ThanksBunny
//
//  Created by 박민아 on 4/22/25.
//

import SwiftUI

struct HomeView: View {
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateStyle = .long
        return formatter.string(from: Date())
    }
    @State private var buttonType: buttonType = .write
    @State private var isClicked = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0){
                Text(formattedDate)
                    .font(.Bunny(size: 40))
                Spacer().frame(height: 10)
                
                Image("MainBunny")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                
                Spacer().frame(height: 10)
                
                Text("오늘의 감사를\n세줄로 적어\n땡스버니에게 건네보세요!")
                    .font(.custom("NanumJungHagSaeng", size: 40))
                    .multilineTextAlignment(.center)
                
                Spacer().frame(height: 40)
                
                HStack {
                    CustomButton(
                        icon: "pencil",
                        text: "세줄감사쓰기",
                        action: {
                            isClicked = true
                            buttonType = .write
                        }
                    )
                    CustomButton(
                        icon: "book",
                        text: "세줄감사읽기",
                        action: {
                            isClicked = true
                            buttonType = .read
                        }
                    )
                }
            }
            .navigationDestination(isPresented: $isClicked, destination: {
                if buttonType == .write{
                    DiaryView()
                } else{
                    CardView()
                }
            })
        }
    }
}

enum buttonType {
    case write
    case read
}
    
#Preview {
    NavigationStack {
        HomeView()
    }
}
