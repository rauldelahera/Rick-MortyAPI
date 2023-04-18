//
//  CharacterService.swift
//  Rick&MortyAPI
//
//  Created by Ludlow, David (D.) on 18/04/2023.
//

import Foundation

class CharacterService {
    func fetchData(url: URL) async throws -> [SearchResult] {
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(SearchResponse.self, from: data)
        return response.results ?? []
    }
}