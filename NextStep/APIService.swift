//
//  APIService.swift
//  NextStep
//
//  Created by Nika Metreveli on 4/13/26.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
}

final class APIService {
    static let shared = APIService()

    private init() {}

    func analyze(text: String) async throws -> AnalysisResponse {
        guard let url = URL(string: "http://127.0.0.1:3000/analyze") else {
            throw APIError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body = ["text": text]
        request.httpBody = try JSONEncoder().encode(body)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }

        if !(200..<300).contains(httpResponse.statusCode) {
            let responseText = String(data: data, encoding: .utf8) ?? "No response body"
            print("Status code:", httpResponse.statusCode)
            print("Response body:", responseText)
            throw APIError.invalidResponse
        }

        return try JSONDecoder().decode(AnalysisResponse.self, from: data)
    }
}
