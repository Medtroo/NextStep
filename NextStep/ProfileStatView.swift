//
//  ProfileStatView.swift
//  NextStep
//
//  Created by Nika Metreveli on 4/13/26.
//

import Foundation
import SwiftUI

struct ProfileStatRow: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(Color.appTextPrimary)

            Spacer()

            Text(value)
                .fontWeight(.semibold)
                .foregroundStyle(Color.appOlive)
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
