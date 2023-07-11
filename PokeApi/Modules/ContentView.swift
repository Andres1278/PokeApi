//
//  ContentView.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 29/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var router: NavigationRouter
    
    var body: some View {
        NavigationSplitView {
            SideBar(selectedOption: $router.selectedOption)
            .environmentObject(router)
            .navigationTitle("Options")
            .font(.title)
        } detail: {
            if let option = router.selectedOption {
                NavigationStack(path: $router.routes) {
                    switch (UIDevice.current.userInterfaceIdiom, option) {
                    case (.phone, .pokemons):
                        PokemonListView()
                    case (.pad, .pokemons):
                        PokemonsGrid()
                    case (_, .movements):
                        MovementListView()
                            .environmentObject(MovementsViewModel())
                    case (_, .abilities):
                        AbilitiesListView()
                            .environmentObject(AbilitiesViewModel())
                    default:
                        Text("We are working in this feature")
                    }
                }
                .environmentObject(router)
            } else {
                Text("Please! Choose an option 😀")
            }
        }
        .tint(.black)
    }
}

#Preview {
    
    ContentView()
        .environmentObject(NavigationRouter())
}
