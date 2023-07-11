//
//  PokemonAbilitiesModel.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 6/07/23.
//

import Foundation

struct AbilityDetail: Codable, Identifiable {
    var id = UUID()
    let name: String
    let effectEntries: [Effect]
    
    enum CodingKeys: String, CodingKey {
        case name
        case effectEntries = "effect_entries"
    }
    
    struct Effect: Codable {
        let effect: String
        let shortEffect: String
        
        enum CodingKeys: String, CodingKey {
            case effect
            case shortEffect = "short_effect"
        }
    }
}
