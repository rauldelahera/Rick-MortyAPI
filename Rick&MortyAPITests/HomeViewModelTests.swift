//
//  Rick_MortyAPITests.swift
//  Rick&MortyAPITests
//
//  Created by de la Hera, Raul (R.) on 25/04/2023.
//

import Combine
import XCTest

@testable import Rick_MortyAPI

final class HomeViewModelTests: XCTestCase {
    var cancellables = Set<AnyCancellable>()
    
    override func tearDown() {
        cancellables.removeAll()
    }
    
    func testPerformSearch() {
        //Now we can create a MockCharacterService and pass this to our viewmodel in tests instead:
        let characterService = MockCharacterService()
        
        let expectedResults: [SearchResult] = [
            .init(id: 1, name: "Name", species: nil, image: "ImageString")]
        //...we can specify what results we want our mock service to return...
        characterService.stubResults = expectedResults
        
        var subject = HomeViewModel(characterService: characterService)
        
        subject.performSearch()
        
        //Now, after we call performSearch, we want to make sure that we give our asynchronous `Task` inside performSearch() enough time to run before continuing the test, so we can use expectations for this:
        
        //Create an expectation that will be fulfilled when our published property is updated with results:
        
        let expectation = expectation(description: "")
        
        var publishedResults: [SearchResult]?
        
        //Subscribe to the published value on our viewmodel and ignore the first value you get back when you subscribe (aka 'sink') to it, this will be the initial empty value []
        
        //Once the next value is published (after our Service returns results)...
        //... we can fulfill the expectation so that the test can continue after L56 below, and store the results we get back in `publishedResults` so that we can use it in an assertion
        
        subject.$results
            .dropFirst()
            .sink { result in
                expectation.fulfill()
                publishedResults = result
            }
            .store(in: &cancellables)
        
        //Wait until our expectation is fullfilled (So that asynchronous `Task` in performSearch has time to complete
        waitForExpectations(timeout: 1.0)
        
        //Then assert that the results we get back are the ones we passed into our MockCharacterService
        XCTAssertEqual(publishedResults, expectedResults)
    }
}
