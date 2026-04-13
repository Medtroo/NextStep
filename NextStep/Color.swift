//
//  Color.swift
//  NextStep
//
//  Created by Nika Metreveli on 4/13/26.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b: UInt64

        switch hex.count {
        case 6:
            (r, g, b) = ((int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (r, g, b) = (0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: 1
        )
    }

    static let appBackground = Color(hex: "F0E6B6")
    static let appCard = Color(hex: "E6D68A")
    static let appBorder = Color(hex: "786338")

    static let appPrimary = Color(hex: "548053")
    static let appPrimaryDark = Color(hex: "579262")

    static let appAccent = Color(hex: "F2BA65")
    static let appOlive = Color(hex: "6B6B28")

    static let appTextPrimary = Color(hex: "634D10")
    static let appTextSecondary = Color(hex: "615327")

    static let appDanger = Color(hex: "786338")
    static let appButtonText = Color.white
    static let appEditorBackground = Color.clear
}
