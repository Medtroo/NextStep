//
//  AnalysisResponse.swift
//  NextStep
//
//  Created by Nika Metreveli on 4/13/26.
//

import Foundation

struct AnalysisResponse: Decodable {
    let simpleExplanation: String
    let keyPoints: [String]
    let deadline: String
    let nextSteps: [String]
}
