//
//  CardView.swift
//  ThanksBunny
//
//  Created by 박민아 on 4/22/25.
//

import SwiftUI
import SwiftData

struct CardView: View {
    /*@Query*/ var diarys: [ThanksDiary] = [
        .init(lineOne: "맛있는 닭가슴살을 먹었다.", lineTwo: "제옹이 알려주셨당", lineThree: "안녕히계세요오오오옵~"),
        .init(lineOne: "스벅스벅", lineTwo: "땡스버니", lineThree: "숩이 알려준 spacer쓰는 방법과 clipShape! 공부를 많이 해야겠다앙"),
        .init(lineOne: "오늘은 비가온다", lineTwo: "C2가 진행되고 있다", lineThree: "정말 많이 배우는 중!! ")]
    var body: some View {
        ScrollView {
            Image("MainBunny")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            LazyVStack(spacing: 20) {
                ForEach(diarys) { diary in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "carrot")
                            Text(diary.lineOne)
                                .font(.Bunny(size: 30))
                            Spacer()
                        }
                        HStack {
                            Image(systemName: "carrot")
                            Text(diary.lineTwo)
                                .font(.Bunny(size: 30))
                        }
                        HStack {
                            Image(systemName: "carrot")
                            Text(diary.lineThree)
                                .font(.Bunny(size: 30))
                        }
                        Text(formattedDate(diary.date))
                            .font(.body)
                            .foregroundColor(.gray)
    
                    }
                    //순서가 중요해!
                    .padding(.vertical, 20)
                    .padding(.leading, 20)
                    .background(Color.bunnyGray)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 30)
                    
                }
            }
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyy년 M월 d일"
        return formatter.string(from: date)
    }
}

#Preview {
    CardView()
}
