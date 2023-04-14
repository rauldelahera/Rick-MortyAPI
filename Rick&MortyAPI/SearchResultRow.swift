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
            AsyncImage(url: resultVM.imgUrl) { image in image.resizable()
            } placeholder: {
                Image(systemName: "camera.fill")
            }
            .frame(width: 100, height: 100)
            .cornerRadius(10)
            Text(resultVM.characterName)
                .font(.system(size: 24, weight: .heavy, design: .default))
                .lineLimit(2)
            Spacer()
            Text(resultVM.species)
                .font(.system(size: 20, weight: .light, design: .default))
        }.padding()
    }
}

struct SearchResultRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultRow(resultVM: SearchResultVM(model: SearchResult.example))
    }
}
