//
//  LongButton.swift
//  ThanksBunny
//
//  Created by 박민아 on 4/18/25.
//

import SwiftUI

struct LongButton: View {
    // 외부에서 전달받을 프로퍼티
    let text: String
    let action: () -> Void
    let isEnabled: Bool

    var body: some View {
        Button(action: {
            if isEnabled {
                action()
            }
        }) {
            VStack(spacing: 5) {
                Text(text)
                    .font(.Bunny(size: 30))
                    .foregroundColor(.black)
            }
            .frame(height: 70)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 27)
            .padding(.vertical, 6)
            .background(isEnabled ? Color(.bunnypink) : .bunnyGray)
            .cornerRadius(16)
        }
        .disabled(!isEnabled)
    }
}
