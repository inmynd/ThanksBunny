//
//  Custom Button.swift
//  ThanksBunny
//
//  Created by 박민아 on 4/22/25.
//

import SwiftUI

struct Custombutton: View {
    var icon: String
    var text: String
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
        .background(Color(.bunnyPink))
        .cornerRadius(16)
        }
    }
}
