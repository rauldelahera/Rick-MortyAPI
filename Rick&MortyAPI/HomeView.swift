//
//  HomeView.swift
//  Rick&MortyAPI
//
//  Created by de la Hera, Raul (R.) on 14/04/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel(characterService: CharacterService())
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.results, id: \.id) { result in
                    let viewModel = SearchResultVM(model: result)
                    NavigationLink {
                        ItemDetail(resultVM: viewModel)
                    } label: {
                    SearchResultRow(resultVM: viewModel)
                    }
                }
            }
            .navigationTitle("Characters")
        }
        .onAppear(perform: viewModel.performSearch)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
