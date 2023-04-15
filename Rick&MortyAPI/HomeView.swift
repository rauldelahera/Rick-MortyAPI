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
        NavigationStack {
            List {
                ForEach(viewModel.results, id: \.id) { result in
                    NavigationLink {
                        VStack() {
                            AsyncImage(url: URL(string: result.image)){ image in image.resizable()
                            } placeholder: {
                                Image(systemName: "camera.fill")
                            }
                            .frame(width: 200, height: 200)
                            Text(result.name!)
                        }.navigationTitle(result.name!)
                    } label: {
                    let viewModel = SearchResultVM(model: result)
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
