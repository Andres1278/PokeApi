//
//  PokemonDetailView.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 5/07/23.
//

import SwiftUI

struct PokemonDetailView: View {
    
    @EnvironmentObject var vm: PokemonsViewModel
    
    let pokemon: any Option
    private let gradient = LinearGradient(
        gradient: Gradient(colors: [.white, .red]),
        startPoint: .topTrailing,
        endPoint: .bottomLeading
    )
    
    var body: some View {
        if let pokemon = pokemon as? PokemonBase {
            
            ScrollView {
                VStack(spacing: 12) {
                    
                    AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(vm.getPokemonIndex(pokemon: pokemon) ).png")
                    ) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(minWidth: 300)
                    } placeholder: {
                        ProgressView()
                            .frame(height: UIScreen.main.bounds.height)
                    }
                    .animation(.interpolatingSpring)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    
                    if let pokemonDetail = vm.pokemonDetails {
                        Text(pokemonDetail.name.capitalized)
                            .font(.system(size: 22, weight: .light, design: .monospaced))
//                        MARK: TYPES
                        Text("Types:")
                            .font(.system(size: 16, weight: .regular, design: .monospaced))
                        HStack {
                            ForEach (pokemonDetail.types) { types in
                                Image("TypeTag/\(types.type.name.capitalized)")
                            }
                        }
//                        MARK: PHYSICAL
                        HStack(alignment: .center, spacing: 32) {
                            Text("Height: \(pokemonDetail.formatHW(value: pokemonDetail.height))m")
                                .font(.system(size: 14, weight: .light, design: .monospaced))
                            Text("Weight: \(pokemonDetail.formatHW(value: pokemonDetail.weight))Kg")
                                .font(.system(size: 14, weight: .light, design: .monospaced))
                        }
//                        MARK: STATS
                        Text("Stats:")
                            .font(.system(size: 18, weight: .regular, design: .monospaced))
                        ForEach (pokemonDetail.stats) { stat in
                            let progres: Float = Float(stat.baseStat) / 100
                            ProgressView(value: progres > 1 ? 1 : progres) {
                                Text(stat.stat.name.capitalized)
                                    .font(.system(size: 14, weight: .light, design: .monospaced))
                            } currentValueLabel: {
                                Text("Value: \(progres.formatted())")
                                    .font(.system(size: 10, weight: .light, design: .monospaced))
                            }
                            .progressViewStyle(.linear)
                            .padding(.horizontal, 40)
                        }
//                        MARK: ABILITIES
                        AbilitiesView(items:pokemonDetail.abilities)
//                        MARK: MOVES
                        MovesView(items: pokemonDetail.moves)
                    }
                    Spacer()
                }
                .task {
                    vm.getDetails(with: pokemon.name)
                }
            }
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: PokemonBase.samplePokemon)
        .environmentObject(PokemonsViewModel())
}
