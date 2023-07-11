//
//  PokemonListView.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 4/07/23.
//

import SwiftUI

struct PokemonListView: View {
    
    @EnvironmentObject private var routerManager: NavigationRouter
    @EnvironmentObject private var vm: PokemonsViewModel

    let title: String = "Pokemons"
    
    var body: some View {

        List(vm.filteredPokemon, id: \.id) { pokemon in
            NavigationLink(destination:
                PokemonDetailView(pokemon: pokemon)
                .environmentObject(PokemonDetailViewModel())
                .navigationBarTitleDisplayMode(.inline)
            ) {
                PokemonSingleItemList(pokemon: pokemon)
                    .environmentObject(PokemonDetailViewModel())
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
        .searchable(
            text: $vm.searchText,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search your favorite Pokemon!"
        )
    }
}

struct PokemonListViewContainer: View {
    
    @StateObject var routerManager = NavigationRouter()
    @StateObject var vm = PokemonsViewModel()
    
    var body: some View {
        NavigationSplitView {
            SideBar(selectedOption: $routerManager.selectedOption)
                .navigationTitle("Menu")
        } detail: {
            NavigationStack(path: $routerManager.routes) {
                if let optionSelected = routerManager.selectedOption {
                    PokemonListView()
                }
            }
        }
        .environmentObject(routerManager)
    }
}

#Preview {
    PokemonListViewContainer()
}
