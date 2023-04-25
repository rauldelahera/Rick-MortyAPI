//
//  HomeViewModel.swift
//  Rick&MortyAPI
//
//  Created by de la Hera, Raul (R.) on 14/04/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var results = [SearchResult]()
    
    private func fetchData(url: URL) async throws -> [SearchResult] {
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(SearchResponse.self, from: data)
        return response.results ?? []
    }
    
    func performSearch() {
        guard let url = URL(
            string: "https://rickandmortyapi.com/api/character"
        ) else { return }
        
        Task {
            if let fetchedResults = try? await fetchData(url: url) {
                await MainActor.run {
                    results = fetchedResults
                }
            }
                                                         
        }
    }
}
