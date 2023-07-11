//
//  PokemonSingleListViewModel.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 8/07/23.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    
    @Published var pokemonDetails: PokemonDetail?
    @Published private(set) var action: Action?
    
    private let pokemonManager = PokemonManager()
    
    enum Action {
        case loading
        case finished
    }
    
    func getDetails(with id: String) {
        action = .loading
        pokemonDetails = nil
        pokemonManager.getPokemonDetail(with: id) { response in
            self.action = .finished
            switch response {
            case .success(let data):
                self.pokemonDetails = data
            case .failure(let error):
                print(error?.localizedDescription as Any)
            }
        }
    }
}
