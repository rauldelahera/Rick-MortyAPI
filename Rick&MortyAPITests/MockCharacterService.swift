//
//  MockCharacterService.swift
//  Rick&MortyAPITests
//
//  Created by Ludlow, David (D.) on 18/04/2023.
//

import Foundation
@testable import Rick_MortyAPI


// We now have something that conforms to CharacterServiceProtocol that we can control (i.e. pass it the results we want it to return in tests)
class MockCharacterService: CharacterServiceProtocol {
    var stubResults: [SearchResult] = []
    
    func fetchData(url: URL) async throws -> [SearchResult] {
        return stubResults
    }
}
