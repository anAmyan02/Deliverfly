//
//  RestaurantPreview.swift
//  Deliverfly
//
//  Created by Anahit Amyan on 16.06.24.
//

import SwiftUI

struct RestaurantPreview: View {
    let restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            headerImage
            restaurantName
            menuItems
            details
        }
    }
    
    var headerImage: some View {
        Image(restaurant.image)
            .resizable()
            .scaledToFill()
            .frame(height: 140)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
    
    var restaurantName: some View {
        Text(restaurant.name)
            .font(.title2)
            .foregroundStyle(.darkBlue)
    }
    
    var menuItems: some View {
        Text(restaurant.foods.map {$0.name}.joined(separator: " - "))
            .font(.subheadline)
            .foregroundStyle(.gray)
            .lineLimit(1)
    }
    
    var details: some View {
        HStack {
            Image(.star)
                .renderingMode(.template)
                .foregroundStyle(.darkOrange)
            Text(String(restaurant.rating))
                .bold()
                .foregroundStyle(.darkBlue)
            Image(.truck)
                .renderingMode(.template)
                .foregroundStyle(.darkOrange)
                .padding(.leading)
            Text("Free")
                .fontWeight(.bold)
                .foregroundStyle(.darkBlue)
            Image(.clock)
                .renderingMode(.template)
                .foregroundStyle(.darkOrange)
                .padding(.leading)
            Text("\(restaurant.time) min")
                .fontWeight(.bold)
                .foregroundStyle(.darkBlue)
        }
        .padding(.vertical)
    }
}

#Preview {
    RestaurantPreview(restaurant: .inNOut)
}
