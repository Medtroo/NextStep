//
//  Saved.swift
//  NextStep
//
//  Created by Nika Metreveli on 4/13/26.
//

import Foundation
import SwiftUI

struct SavedView: View {
    @Binding var saved: [AnalysisEntry]

    var body: some View {
        NavigationStack {
            List {
                ForEach(saved) { entry in
                    NavigationLink {
                        HistoryDetailView(entry: entry)
                    } label: {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(entry.deadline)
                                .font(.headline)
                                .foregroundStyle(Color.appTextPrimary)

                            Text(entry.originalText)
                                .lineLimit(2)
                                .foregroundStyle(Color.appTextSecondary)

                            Text(entry.nextSteps)
                                .lineLimit(2)
                                .font(.subheadline)
                                .foregroundStyle(Color.appOlive)
                        }
                        .padding(.vertical, 4)
                    }
                    .listRowBackground(Color.appCard)
                }
                .onDelete(perform: deleteItems)
            }
            .scrollContentBackground(.hidden)
            .background(Color.appBackground)
            .navigationTitle("Saved")
            .toolbar {
                #if os(iOS)
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
                #endif
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        saved.remove(atOffsets: offsets)
    }
}
