//
//  ContentView.swift
//  NextStep
//
//  Created by Nika Metreveli on 4/12/26.
//

import SwiftUI

struct ContentView: View {
    @State private var history: [AnalysisEntry] = []
    @State private var saved: [AnalysisEntry] = []

    var body: some View {
        TabView {
            HomeView(history: $history, saved: $saved)
                .tabItem {
                    Label(AppStrings.home, systemImage: AppIcons.home)
                }

            HistoryView(history: $history)
                .tabItem {
                    Label(AppStrings.history, systemImage: AppIcons.history)
                }

            SavedView(saved: $saved)
                .tabItem {
                    Label(AppStrings.saved, systemImage: AppIcons.saved)
                }

            ProfileView(historyCount: history.count, savedCount: saved.count)
                .tabItem {
                    Label(AppStrings.profile, systemImage: AppIcons.profile)
                }
        }
        .tint(Color.appPrimary)
    }
}

#Preview {
    ContentView()
}
