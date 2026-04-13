//
//  AnalysisEntry.swift
//  NextStep
//
//  Created by Nika Metreveli on 4/12/26.
//

import Foundation

struct AnalysisEntry: Identifiable {
    let id = UUID()
    let originalText: String
    let explanation: String
    let keyPoints: String
    let deadline: String
    let nextSteps: String
}
