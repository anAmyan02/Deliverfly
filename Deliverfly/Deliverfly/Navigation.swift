//
//  Navigation.swift
//  Deliverfly
//
//  Created by Anahit Amyan on 23.06.24.
//

import Foundation
import SwiftUI

class Navigation: ObservableObject {
    @Published var path  = NavigationPath()
    
    enum View: Hashable {
        case restaurant(info: Restaurant)
    }
    
    func goTo(view: View) {
        path.append(view)
    }
    
    func goBack() {
        path.removeLast()
    }
}
