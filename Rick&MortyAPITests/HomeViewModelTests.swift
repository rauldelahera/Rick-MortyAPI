//
//  Rick_MortyAPITests.swift
//  Rick&MortyAPITests
//
//  Created by de la Hera, Raul (R.) on 25/04/2023.
//

import XCTest

@testable import Rick_MortyAPI

final class HomeViewModelTests: XCTestCase {
    func testPerformSearch() {
        let characterService = CharacterService()
        
        var subject = HomeViewModel(characterService: characterService)
        
        subject.performSearch()
        
        XCTAssertEqual(subject.results, [])
    }
}
