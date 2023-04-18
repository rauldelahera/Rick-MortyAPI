//
//  Rick_MortyAPITests.swift
//  Rick&MortyAPITests
//
//  Created by Ludlow, David (D.) on 18/04/2023.
//

import XCTest

@testable import Rick_MortyAPI

final class HomeViewModelTests: XCTestCase {
    func testPerformSearch() {
        //This test passes, but is it correct? No, we're calling the real API by using CharacterService in our test here and after calling performSearch(), we at least expect subject.results to not be empty.
        
        let characterService = CharacterService()
        var subject = HomeViewModel(characterService: characterService)
        subject.performSearch()        
        XCTAssertEqual(subject.results, [])
    }
}
