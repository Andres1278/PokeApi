//
//  PokemonModel.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 29/06/23.
//

import Foundation

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let list: [PokemonBase]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case list = "results"
    }
}
