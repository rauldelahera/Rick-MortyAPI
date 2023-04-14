//
//  HomeView.swift
//  Rick&MortyAPI
//
//  Created by de la Hera, Raul (R.) on 14/04/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(viewModel.results, id: \.id) {
                        SearchResultRow(resultVM: SearchResultVM(model: $0))
                    }
                }
            }
            .navigationTitle("Characters")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
