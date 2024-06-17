//
//  DeliverflyApp.swift
//  Deliverfly
//
//  Created by Anahit Amyan on 16.06.24.
//

import SwiftUI

@main
struct DeliverflyApp: App {
    @State private var isSplash = true
    var body: some Scene {
        WindowGroup {
            if isSplash {
                SplashView()
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                            isSplash = false
                        }
                    })
            } else {
                HomeView()
            }
        }
    }
}
