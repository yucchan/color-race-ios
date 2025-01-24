//
//  CarColor.swift
//  color-race-ios
//
//  Created by Yuliya Smirnova on 23/01/2025.
//
import SwiftUI
import Foundation

enum CarColor: String, CaseIterable {
    case white = "white"
    case black = "black"
    case blue = "blue"
    case yellow = "yellow"
    case red = "red"
    case orange = "orange"
    case green = "green"
    
    // Function to return the Russian word for the color
    func toRussian() -> String {
        switch self {
        case .white: return "белый"
        case .black: return "чёрный"
        case .blue: return "синий"
        case .yellow: return "жёлтый"
        case .red: return "красный"
        case .orange: return "оранжевый"
        case .green: return "зелёный"
        }
    }
    
    func colorFromText() -> Color {
        switch self {
        case .white: return .white
        case .black: return .black
        case .blue: return .blue
        case .yellow: return .yellow
        case .red: return .red
        case .orange: return .orange
        case .green: return .green
        }
    }
}
