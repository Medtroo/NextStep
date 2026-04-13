//
//  ProfileView.swift
//  NextStep
//
//  Created by Nika Metreveli on 4/13/26.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    let historyCount: Int
    let savedCount: Int

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                Image(systemName: AppIcons.profileLarge)
                    .font(.system(size: 90))
                    .foregroundStyle(Color.appPrimary)

                VStack(spacing: 6) {
                    Text("Guest User")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.appTextPrimary)

                    Text("No email added")
                        .foregroundStyle(Color.appTextSecondary)
                }

                VStack(spacing: 12) {
                    ProfileStatRow(title: "Total Analyses", value: "\(historyCount)")
                    ProfileStatRow(title: "Saved Items", value: "\(savedCount)")
                    ProfileStatRow(title: "Mode", value: "Local")
                }

                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.appBackground)
            .navigationTitle("Profile")
        }
    }
}
