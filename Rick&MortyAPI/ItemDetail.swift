//
//  ItemDetail.swift
//  Rick&MortyAPI
//
//  Created by de la Hera, Raul (R.) on 15/04/2023.
//

import SwiftUI

struct ItemDetail: View {
    
    let resultVM: SearchResultVM
    
    var body: some View {
        VStack() {
            AsyncImage(url: resultVM.imgUrl){ image in image.resizable()
            } placeholder: {
                Image(systemName: "camera.fill")
            }
            .frame(width: 200, height: 200)
            Text(resultVM.characterName)
        }.navigationTitle(resultVM.characterName)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetail(resultVM: SearchResultVM(model: SearchResult.example))
    }
}
