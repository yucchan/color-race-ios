//
//  Car.swift
//  color-race-ios
//
//  Created by Yuliya Smirnova on 22/01/2025.
//

import SwiftUI
import Foundation

struct Car: View {
    let colorName: CarColor

    var body: some View {
        VStack {
            // Display image based on colorName
            Image(colorName.rawValue)
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 300)
                .padding(.bottom)
        }
    }
}

#Preview {
    Car(colorName: CarColor.allCases.randomElement() ?? .white) // Default to `.white` if nil
}
