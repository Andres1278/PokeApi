//
//  PokemonGridView.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 29/06/23.
//

import SwiftUI

struct PokemonSingleGridView: View {
    
    @EnvironmentObject var vm: PokemonsViewModel
    @EnvironmentObject var viewModel: PokemonDetailViewModel
    
    let pokemon: PokemonBase
    let dimensions: Double = 200
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string:
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(vm.getPokemonIndex(pokemon: pokemon)).png")
            ) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: dimensions)
            } placeholder: {
                ProgressView()
                    .frame(width: dimensions, height: dimensions)
                    
            }
            Text("\(pokemon.name.capitalized)")
                .font(.system(size: 16, weight: .regular, design: .monospaced))
            if let pokemonDetail = viewModel.pokemonDetails {
                VStack(alignment: .center, spacing: 4) {
                    Text("Type:")
                        .font(.system(size: 8, weight: .light, design: .monospaced))
                    Text(pokemonDetail.types.first?.type.name ?? "")
                        .font(.system(size: 10, weight: .ultraLight, design: .monospaced))
                }
            } else {
                Spacer()
            }
        }
        .tint(.black)
//        .overlay(
//            RoundedRectangle(cornerRadius: 20)
//                .inset(by: 5)
//                .stroke(.gray, lineWidth: 5)
//        )
        .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
        .task {
            viewModel.getDetails(with: pokemon.name)
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonSingleGridView(pokemon: PokemonBase.samplePokemon)
            .environmentObject(PokemonsViewModel())
    }
}
