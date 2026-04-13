//
//  HistoryDetail.swift
//  NextStep
//
//  Created by Nika Metreveli on 4/13/26.
//

import Foundation
import SwiftUI

struct HistoryDetailView: View {
    let entry: AnalysisEntry

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Saved Result")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.appTextPrimary)

                ResultCard(title: "Original Text", content: entry.originalText)
                ResultCard(title: "Simple Explanation", content: entry.explanation)
                ResultCard(title: "Key Points", content: entry.keyPoints)
                ResultCard(title: "Deadline", content: entry.deadline)
                ResultCard(title: "Next Steps", content: entry.nextSteps)
            }
            .padding()
        }
        .background(Color.appBackground)
    }
}
