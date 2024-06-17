//
//  HomeView.swift
//  Deliverfly
//
//  Created by Anahit Amyan on 16.06.24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        // go to history
                    }, label: {
                        Image(.history)
                            .padding()
                            .background(.lightGray)
                            .clipShape(Circle())
                    })
                    VStack(alignment: .leading) {
                        Text("DELIVER TO")
                            .font(.caption)
                            .bold()
                            .foregroundStyle(.darkOrange)
                        Text("16 Halabyan St, Yerevan 0038")
                            .font(.footnote)
                            .foregroundStyle(.darkGray)
                    }
                    .padding()
                }
                RestaurantPreview(restaurant: .inNOut)
                RestaurantPreview(restaurant: .inNOut)
                RestaurantPreview(restaurant: .inNOut)
            }
        }
        .padding(.horizontal)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    HomeView()
}
