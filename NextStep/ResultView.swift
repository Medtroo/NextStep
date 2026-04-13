//
//  ResultView.swift
//  NextStep
//
//  Created by Nika Metreveli on 4/13/26.
//

import Foundation
import SwiftUI

struct ResultView: View {
    let inputText: String
    @Binding var history: [AnalysisEntry]
    @Binding var saved: [AnalysisEntry]
    @State private var hasAddedToHistory = false

    var currentEntry: AnalysisEntry {
        AnalysisEntry(
            originalText: inputText,
            explanation: simpleExplanation,
            keyPoints: keyPoints,
            deadline: deadlineText,
            nextSteps: nextSteps
        )
    }

    var simpleExplanation: String {
        let text = inputText.lowercased()

        if text.contains("due") || text.contains("deadline") {
            return "This message says that something must be finished before a specific deadline."
        } else if text.contains("submit") {
            return "This message gives instructions for turning in work."
        } else if text.contains("meeting") {
            return "This message is about a meeting or scheduled event."
        } else {
            return "This message contains important instructions or information."
        }
    }

    var keyPoints: String {
        let text = inputText.lowercased()

        if text.contains("canvas") {
            return "• Submit the assignment on Canvas\n• Check the instructions carefully"
        } else if text.contains("assignment") {
            return "• This is about an assignment\n• Read the instructions before submitting"
        } else {
            return "• Read the message carefully\n• Find the main instruction"
        }
    }

    var deadlineText: String {
        let text = inputText.lowercased()

        if text.contains("friday") && text.contains("11:59") {
            return "Friday, 11:59 PM"
        } else if text.contains("friday") {
            return "Friday"
        } else if text.contains("monday") {
            return "Monday"
        } else {
            return "No clear deadline found"
        }
    }

    var nextSteps: String {
        let text = inputText.lowercased()

        if text.contains("submit") && text.contains("canvas") {
            return "1. Finish the assignment\n2. Review your work\n3. Submit it on Canvas before the deadline"
        } else if text.contains("submit") {
            return "1. Finish the work\n2. Review it carefully\n3. Submit it on time"
        } else {
            return "1. Read the message again\n2. Find the important action\n3. Complete it before the deadline"
        }
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Result")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.appTextPrimary)

                ResultCard(
                    title: "Original Text",
                    content: inputText.isEmpty ? "No text was entered." : inputText
                )

                ResultCard(
                    title: "Simple Explanation",
                    content: simpleExplanation
                )

                ResultCard(
                    title: "Key Points",
                    content: keyPoints
                )

                ResultCard(
                    title: "Deadline",
                    content: deadlineText
                )

                ResultCard(
                    title: "Next Steps",
                    content: nextSteps
                )

                Button {
                    let alreadySaved = saved.contains { $0.originalText == currentEntry.originalText }

                    if !alreadySaved {
                        saved.insert(currentEntry, at: 0)
                    }
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundStyle(Color.appButtonText)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.appPrimaryDark)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            }
            .padding()
        }
        .onAppear {
            if !hasAddedToHistory {
                let alreadyInHistory = history.contains { $0.originalText == currentEntry.originalText }

                if !alreadyInHistory {
                    history.insert(currentEntry, at: 0)
                }

                hasAddedToHistory = true
            }
        }
        .background(Color.appBackground)
    }
}
