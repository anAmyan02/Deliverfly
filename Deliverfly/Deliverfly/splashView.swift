//
//  SplashView.swift
//  Deliverfly
//
//  Created by Anahit Amyan on 16.06.24.
//

import SwiftUI

struct SplashView: View {
    @State private var animationValue = 0.5
    
    var body: some View {
        VStack {
            Image(.logo)
                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .padding() 
                .scaleEffect(animationValue)
            
            Text("Deliverfly")
                .font(.title)
                .fontWeight(.medium)
                .foregroundStyle(.white)
                .opacity(animationValue)
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.darkOrange, ignoresSafeAreaEdges: .all)
        .animation(.easeInOut(duration: 1.5), value: animationValue)
        .onAppear(perform: {
            animationValue = 1.0
        })
    }
}

#Preview {
    SplashView()
}
