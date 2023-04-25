//
//  HomeViewModel.swift
//  Rick&MortyAPI
//
//  Created by de la Hera, Raul (R.) on 14/04/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var results: [SearchResult] = []
    
    private let characterService: CharacterService
    
    init(characterService: CharacterService) {
        self.characterService = characterService
    }
    
    func performSearch() {
        guard let url = URL(
            string: "https://rickandmortyapi.com/api/character"
        ) else { return }
        
        Task {
            if let fetchedResults = try? await characterService.fetchData(url: url) {
                await MainActor.run {
                    results = fetchedResults
                }
            }
                                                         
        }
    }
}
