//
//  CharacterService.swift
//  Rick&MortyAPI
//
//  Created by de la Hera, Raul (R.) on 25/04/2023.
//

import Foundation

class CharacterService {
    private func fetchData(url: URL) async throws -> [SearchResult] {
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(SearchResponse.self, from: data)
        return response.results ?? []
    }
}
