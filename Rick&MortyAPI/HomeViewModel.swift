//
//  HomeViewModel.swift
//  Rick&MortyAPI
//
//  Created by de la Hera, Raul (R.) on 14/04/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var results = [SearchResult]()
    
    func performSearch () {
        
        guard let gUrl = URL(
            string: "https://rickandmortyapi.com/api/character"
        ) else { return }
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: gUrl)
                let response = try JSONDecoder().decode(SearchResponse.self, from: data)
                DispatchQueue.main.async { [weak self] in
                    self?.results = response.results ?? []
                }
            } catch {
                print("*** ERROR ***\(error)")
            }
        }
    }
}
