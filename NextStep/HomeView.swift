//
//  HomeView.swift
//  NextStep
//
//  Created by Nika Metreveli on 4/13/26.
//
import SwiftUI

struct HomeView: View {
    @State private var inputText = ""
    @Binding var history: [AnalysisEntry]
    @Binding var saved: [AnalysisEntry]

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(AppStrings.appName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.appTextPrimary)

                Text(AppStrings.homeSubtitle)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color.appTextSecondary)

                ZStack(alignment: .topLeading) {
                    if inputText.isEmpty {
                        Text(AppStrings.editorPlaceholder)
                            .foregroundStyle(Color.appTextSecondary)
                            .padding(.top, 20)
                            .padding(.horizontal, 18)
                    }

                    TextEditor(text: $inputText)
                        .frame(height: 220)
                        .padding(12)
                        .scrollContentBackground(.hidden)
                        .background(Color.appEditorBackground)
                        .foregroundStyle(Color.appTextPrimary)
                }
                .background(Color.appCard.opacity(0.35))
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.appBorder, lineWidth: 2)
                )

                NavigationLink {
                    ResultView(inputText: inputText, history: $history, saved: $saved)
                } label: {
                    Text("Analyze")
                        .font(.headline)
                        .foregroundStyle(Color.appButtonText)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.appPrimary)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }

                Button {
                    inputText = ""
                } label: {
                    Text("Clear")
                        .font(.subheadline)
                        .foregroundStyle(Color.appOlive)
                }

                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.appBackground)
        }
    }
}
