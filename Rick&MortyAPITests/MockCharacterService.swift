//
//  MockCharacterService.swift
//  Rick&MortyAPITests
//
//  Created by de la Hera, Raul (R.) on 25/04/2023.
//

import Foundation
@testable import Rick_MortyAPI

class MockCharacterService: CharacterServiceProtocol {
    var stubResults: [SearchResult] = []
    
    func fetchData(url: URL) async throws -> [SearchResult] {
        return stubResults
    }
}
