//
//  FoodView.swift
//  Deliverfly
//
//  Created by Anahit Amyan on 30.06.24.
//

import SwiftUI

struct FoodView: View {
    
    @Environment (\.dismiss) private var dismiss
    @State private var selectedIngredients: [Ingredient] = []
    @State private var quantity: Int = 1
    private var total: Double {
        food.price*Double(quantity)
    }
    let food: Food
    
    var body: some View {
        VStack{
            ScrollView{
                image
                VStack(alignment: .leading){
                    title
                    description
                    if !food.ingredients.isEmpty {
                        subtitle
                        ingredientsList
                    }
                }
                .padding()
            }
            Group {
                Divider()
                HStack {
                    totalPrice
                    Spacer()
                    itemQuantity
                }
                addToCart
            }
            .padding(.horizontal)
        }
    }
    var image: some View{
        Image(food.image)
            .resizable()
            .scaledToFill()
            .frame(height:200)
            .clipShape(
                .rect(
                     topLeadingRadius: 0,
                     bottomLeadingRadius: 30,
                     bottomTrailingRadius: 30,
                     topTrailingRadius: 0
                    )
            )
    }
    var title: some View{
        Text(food.name)
            .font(.title2)
            .bold()
            .foregroundStyle(.darkBlue)
    }
    
    var description: some View {
        Text(food.description)
            .font(.subheadline)
            .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            .foregroundStyle(.gray)
            .padding(.top, 5)
            .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
    }
    
    var subtitle: some View {
        Text("Ingredients".uppercased())
            .font(.footnote)
            .fontWeight(.light)
            .kerning(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
            .padding(.vertical, 10)
    }
    
    var ingredientsList: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50), alignment: .top)], content: {
            ForEach(food.ingredients, id: \.self) { ingredient in
                Button(action: {
                    ingredientTapped(ingredient)
                }, label: {
                    ingredientButton(ingredient)
                })
            }
           
        })
    }
            
    @ViewBuilder func ingredientButton(_ ingredient: Ingredient) -> some View {
        VStack {
            Image(ingredient.rawValue)
                .renderingMode(.template)
                .frame(width: 50, height: 50)
                .foregroundStyle(isSelected(ingredient) ? .lightOrange : .darkOrange)
                .background(isSelected(ingredient) ? .darkOrange : .lightOrange)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            Text(ingredient.rawValue)
                .font(.footnote)
                .foregroundStyle(.darkGray)
        }
        .padding(.bottom)
    }
    
    func isSelected(_ ingredient: Ingredient) -> Bool {
        selectedIngredients.contains{ $0 == ingredient }
    }
    
    func ingredientTapped(_ ingredient: Ingredient) {
        if selectedIngredients.contains(where: {$0 == ingredient}) {
            selectedIngredients.removeAll{ $0 == ingredient }
        } else if selectedIngredients.count < 3 {
            selectedIngredients.append(ingredient)
        }
    }
    
    var totalPrice: some View {
        Text(total, format: .currency(code: "USD"))
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.medium)
            .padding(.vertical, 10)
    }
    
    var itemQuantity: some View {
        Group {
            Button(action: {
                if quantity > 0 {
                    quantity -= 1
                }
            }, label: {
                Text("-")
                    .bold()
                    .foregroundStyle(.darkGray)
                    .frame(width: 25, height: 25)
                    .background(.lightGray)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            })
            Text("\(quantity)")
                .bold()
                .padding(.horizontal)
            Button(action: {
                if quantity < 10 {
                    quantity += 1
                }
            }, label: {
                Text("+")
                    .bold()
                    .foregroundStyle(.darkGray)
                    .frame(width: 25, height: 25)
                    .background(.lightGray)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            })
        }
    }
    
    var addToCart: some View {
        Button(action: {
            dismiss()
        }, label: {
            Text("Add To Cart".uppercased())
                .bold()
                .frame(maxWidth: .infinity, minHeight: 60)
                .foregroundStyle(quantity == 0 ? .gray : .white)
                .background(quantity == 0 ? .lightGray : .darkOrange)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        })
    }
}

#Preview {
    FoodView(food: .doubleDouble)
}
