//
//  ColorExtension.swift
//  InstaApp
//
//  Created by Douglas Santos on 04/09/21.
//

import SwiftUI

extension Color {
    
    // Cores primarias
    static let principal = Color(hex: 0x7C3BD9)
    static let principal2 = Color(hex: 0xD9043D)
    static let principal3 = Color(hex: 0xF2BD1D)
    static let principal4 = Color(hex: 0xF2911B)
    static let principal5 = Color(hex: 0xF26A1B)
    
    static let danger = Color(hex: 0xF01707)
    
    static let textColorDark = Color(hex: 0x1D0E33)
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
