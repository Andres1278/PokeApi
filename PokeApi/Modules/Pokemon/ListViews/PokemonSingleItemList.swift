//
//  PokemonSingleItemList.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 4/07/23.
//

import SwiftUI

struct PokemonSingleItemList: View {
    
    @EnvironmentObject var vm: PokemonsViewModel
    @EnvironmentObject var viewModel: PokemonDetailViewModel
    let pokemon: PokemonBase
    
    var body: some View {
        if let pokemon = pokemon as? PokemonBase {
            HStack(alignment: .center, spacing: 8) {
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png")
                ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                } placeholder: {
                    ProgressView()
                        .frame(height: 50)
                }
                Text("\(pokemon.name.capitalized)")
                    .font(.system(size: 16, weight: .regular, design: .monospaced))
                Spacer()
                if let pokemonDetail = viewModel.pokemonDetails {
                    ForEach (pokemonDetail.types) { types in
                        Image("Badge/\(types.type.name.capitalized)")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .scaledToFit()
                    }
                }
            }
            .task {
                viewModel.getDetails(with: pokemon.name)
            }
        }
    }
}

#Preview {
    PokemonSingleItemList(pokemon: PokemonBase.samplePokemon)
        .environmentObject(PokemonDetailViewModel())
        .environmentObject(PokemonsViewModel())
}
