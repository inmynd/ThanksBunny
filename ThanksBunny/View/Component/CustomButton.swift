//
//  Button.swift
//  ThanksBunny
//
//  Created by 박민아 on 4/15/25.
//

import SwiftUI

struct CustomButton: View {
    // 외부에서 전달받을 프로퍼티
    var icon: String
    var iclonWeight: Font.Weight = .regular
    let text: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 5) {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 40)
                    .foregroundColor(.black)
                Text(text)
                    .font(.Bunny(size: 30))
                    .foregroundColor(.black)
            }
            .frame(width: 112, height: 108)
            .padding(.horizontal, 27)
            .padding(.vertical, 6)
            .background(Color(.bunnypink))
            .cornerRadius(16)
        }
    }
}
