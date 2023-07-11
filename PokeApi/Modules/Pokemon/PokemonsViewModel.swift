//
//  ViewModel.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 29/06/23.
//

import Foundation
import SwiftUI
import OSLog

class PokemonsViewModel: ObservableObject {
    
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [PokemonBase]()
    @Published var pokemonDetails: PokemonDetail?
    @Published var pokemonMoves: Moves?
    @Published var pokemonType: Types?
    @Published var pokemonAbilities: [AbilityDetail]?
    @Published var searchText = ""
    @Published private(set) var action: Action?
    
    var pokemonAbilitiesName: String?
    
    // Used with searchText to filter pokemon results
    var filteredPokemon: [PokemonBase] {
        return searchText == "" ? pokemonList : pokemonList.filter { $0.name.contains(searchText.lowercased()) }
    }
    
    enum Action {
        case loading
        case finished
    }
    
    init() {
        action = .loading
        pokemonManager.getPokemons { response in
            self.action = .finished
            switch response {
            case .success(let data):
                self.pokemonList = data?.list ?? []
            case .failure(let error):
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    // Get the index of a pokemon ( index + 1 = pokemon id)
    func getPokemonIndex(pokemon: PokemonBase) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getDetails(with name: String) {
        pokemonDetails = nil
        pokemonManager.getPokemonDetail(with: name) { response in
            switch response {
            case .success(let data):
                self.pokemonDetails = data
            case .failure(let error):
                print(error?.localizedDescription as Any)
            }
        }
    }
    
//    func getMovements(for name: String) {
//        pokemonManager.getMovementDetail(with: name) { response in
//            switch response {
//            case .success(let response):
//                self.pokemonMoves = response
//            case .failure(let error):
//                print(error?.localizedDescription as Any)
//            }
//        }
//    }
    
    func getAbilities(for name: String) {
        guard pokemonAbilitiesName == name else { return }
        pokemonAbilitiesName = name
        pokemonAbilities = nil
        pokemonManager.getAbility(with: name) { response in
            switch response {
            case .success(let response):
                guard let ability = response else { return }
                self.pokemonAbilities?.append(ability)
            case .failure(let error):
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    func getType(for pokemon: PokemonBase) {
        let id: String = String(getPokemonIndex(pokemon: pokemon))
        pokemonManager.getPokemonType(with: id) { response in
            switch response {
            case .success(let response):
                self.pokemonType = response
            case .failure(let error):
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    func getItems(in category: MenuOptions?) -> [any Option]? {
        guard case .finished = action,
              let category = category else { return nil }
        switch category {
        case .pokemons:
            return pokemonList
        default:
            return nil
        }
    }
    
}

