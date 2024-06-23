//
//  HomeView.swift
//  Deliverfly
//
//  Created by Anahit Amyan on 16.06.24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var navigation: Navigation
    
    let list: [Restaurant] = .restaurants
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    historyButton
                    deliveryAddress
                    Spacer()
                }
                restaurants
                restaurantsList
            }
        }
        .padding(.horizontal)
        .scrollIndicators(.hidden)
    }
    
    var historyButton: some View {
        Button(action: {
            //            goto history
        }, label: {
            Image(.history)
                .padding()
                .background(.lightGray)
                .clipShape(Circle())
        })
    }
    
    var deliveryAddress: some View {
        VStack(alignment: .leading){
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
    var restaurants: some View {
        Text("Restaurants")
            .font(.title3)
            .padding(.vertical)
    }
    
    var restaurantsList: some View {
        VStack{
            ForEach(list, id: \.self) { restaurant in
                Button(action: {
                    navigation.goTo(view: .restaurant(info: restaurant))
                }, label: {
                    RestaurantPreview(restaurant: restaurant)
                })
            }
        }
    }
}

#Preview {
    HomeView()
}
