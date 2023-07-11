//
//  PokemonsTypesModel.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 6/07/23.
//

import Foundation

struct Types: Codable {
    
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
