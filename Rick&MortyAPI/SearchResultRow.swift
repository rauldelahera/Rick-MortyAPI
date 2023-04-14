//
//  SearchResultRow.swift
//  Rick&MortyAPI
//
//  Created by de la Hera, Raul (R.) on 14/04/2023.
//

import SwiftUI

struct SearchResultRow: View {
    
    let resultVM: SearchResultVM
    
    var body: some View {
        HStack {
            AsyncImage(url: resultVM.imgUrl)
            .frame(width: 100, height: 100)
            .cornerRadius(10)
            Text(resultVM.characterName)
                .font(.system(size: 26, weight: .heavy, design: .default))
            Spacer()
            Text(resultVM.species)
                .font(.system(size: 16, weight: .light, design: .default))
        }.padding()
    }
}

struct SearchResultRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultRow(resultVM: SearchResultVM(model: SearchResult.example))
    }
}
