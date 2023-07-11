//
//  MenuOptions.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 4/07/23.
//

import Foundation


enum MenuOptions: Int, CaseIterable, Identifiable {
    case pokemons
    case abilities
    case movements
    
    var id: Int { rawValue }
}

extension MenuOptions {
    
    var title: String {
        switch self {
        case .pokemons: return "Pokemons List"
        case .abilities: return "Abilities"
        case .movements: return "Movements"
        }
    }
    
    var image: String {
        switch self {
        case .pokemons: return "birthday.cake"
        case .abilities: return "mug"
        case .movements: return "fork.knife"
        }
    }
}
