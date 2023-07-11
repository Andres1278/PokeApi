//
//  PokemonsGrid.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 5/07/23.
//

import SwiftUI

struct PokemonsGrid: View {
    
    @EnvironmentObject private var vm: PokemonsViewModel
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 200))
    ]
    
    var body: some View {
        Group {
            switch vm.action {
            case .loading:
                ProgressView()
            case .finished:
                ScrollView {
                    LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                        ForEach(vm.filteredPokemon) { pokemon in
                            NavigationLink(destination:
                                PokemonDetailView(pokemon: pokemon)
                                    .environmentObject(PokemonDetailViewModel())
                            ) {
                                PokemonSingleGridView(pokemon: pokemon)
                                    .environmentObject(PokemonDetailViewModel())
                            }
                        }
                    }
                    .animation(.easeInOut(duration: 0.3), value: vm.filteredPokemon.count)
                    .navigationBarTitleDisplayMode(.inline)
                    .padding(EdgeInsets(top: 8, leading: 4, bottom: 4, trailing: 8))
                }
                .searchable(
                    text: $vm.searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "Search for your favorite Pokemon!"
                )
            default:
                EmptyView()
            }
        }
    }
}

#Preview {
    PokemonsGrid()
}
