//
//  ThanksApp.swift
//  Thanks
//
//  Created by 박민아 on 4/22/25.
//

import SwiftUI

@main
struct ThanksApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: ThanksDiary.self)
    }
}
