//
//  DeliverflyApp.swift
//  Deliverfly
//
//  Created by Anahit Amyan on 16.06.24.
//

import SwiftUI

@main
struct DeliverflyApp: App {
    @ObservedObject private var navigation = Navigation()
    @State private var isSplash = true
    
    var body: some Scene {
        WindowGroup {
            if isSplash {
                SplashView()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                            isSplash = false
                        }
                    }
            } else {
                NavigationStack(path: $navigation.path){
                    HomeView()
                        .navigationBarBackButtonHidden()
                        .navigationDestination(for: Navigation.View.self) { view in
                            switch view {
                            case .restaurant(let info):
                                RestaurantView(restaurant: info)
                                    .navigationBarBackButtonHidden()
//                                case histor/ case order/ ...
                            }
                        }
                }
                .environmentObject(navigation)
            }
        }
    }
}
