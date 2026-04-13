//
//  ResultCard.swift
//  NextStep
//
//  Created by Nika Metreveli on 4/13/26.
//

import Foundation
import SwiftUI

struct ResultCard: View {
    let title: String
    let content: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(Color.appTextPrimary)

            Text(content)
                .foregroundStyle(Color.appTextSecondary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(Color.appCard)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.appBorder.opacity(0.7), lineWidth: 1)
        )
    }
}
