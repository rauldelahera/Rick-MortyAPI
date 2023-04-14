//
//  SearchResponse.swift
//  Rick&MortyAPI
//
//  Created by de la Hera, Raul (R.) on 14/04/2023.
//

import Foundation

//MARK: - Main Object
struct SearchResponse: Codable {
    let info: [Info]?
    let results: [SearchResult]?
}

struct Info: Codable {
    var count: Int?
    var pages: Int?
}

//MARK: - Result Item
struct SearchResult: Codable {
    var id: Int?
    var name: String?
    var species: String?
    var image: String
}

#if DEBUG
extension SearchResult {
    static var example: SearchResult {
        SearchResult(
            id: 12,
            name: "Beth Smith",
            species: "Human",
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
        )
        
    }
}
#endif
//    {
//      "info": {
//        "count": 826,
//        "pages": 42,
//        "next": "https://rickandmortyapi.com/api/character/?page=2",
//        "prev": null
//      },
//      "results": [
//        {
//          "id": 1,
//          "name": "Rick Sanchez",
//          "status": "Alive",
//          "species": "Human",
//          "type": "",
//          "gender": "Male",
//          "origin": {
//            "name": "Earth",
//            "url": "https://rickandmortyapi.com/api/location/1"
//          },
//          "location": {
//            "name": "Earth",
//            "url": "https://rickandmortyapi.com/api/location/20"
//          },
//          "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
//          "episode": [
//            "https://rickandmortyapi.com/api/episode/1",
//            "https://rickandmortyapi.com/api/episode/2",
//            // ...
//          ],
//          "url": "https://rickandmortyapi.com/api/character/1",
//          "created": "2017-11-04T18:48:46.250Z"
//        },
//        // ...
//      ]
//    }

