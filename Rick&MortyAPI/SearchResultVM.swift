//
//  SearchResultVM.swift
//  Rick&MortyAPI
//
//  Created by de la Hera, Raul (R.) on 14/04/2023.
//

import Foundation

struct SearchResultVM {
  
    let model: SearchResult
    
    var characterName: String {
        model.name ?? ""
    }
    
    var species: String {
        model.species ?? ""
    }
    
    var imgUrl: URL? {
        URL(string: model.image)
    }
}
