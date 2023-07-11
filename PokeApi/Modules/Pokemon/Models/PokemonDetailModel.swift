//
//  PokemonDetailModel.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 29/06/23.
//

import Foundation

typealias Move = BaseModel
typealias PokemonType = BaseModel
typealias Ability = BaseModel

struct PokemonDetail: Codable {
    
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let abilities: [Abilities]
    let types: [Types]
    let moves: [Moves]
    let sprites: Sprite
    let stats: [PokemonStat]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case height
        case weight
        case abilities
        case types
        case moves
        case sprites
        case stats
    }
    
    struct PokemonStat: Codable, Identifiable {
        let id = UUID()
        let stat: Stat
        let baseStat: Int
        
        enum CodingKeys: String, CodingKey {
            case stat
            case baseStat = "base_stat"
        }
        
        struct Stat: Codable {
            let name: String
        }
    }
    
    struct Types: Codable, Identifiable {
        let id = UUID()
        let type: PokemonType
        
        enum CodingKeys: String, CodingKey {
            case type
        }
    }
    
    struct Sprite: Codable {
        let frontDefault: String
        
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
        }
    }
    
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        return string
    }
}

struct BaseModel: Codable, Identifiable {
    let id = UUID()
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}

struct Moves: Codable, Identifiable {
    let id = UUID()
    let move: Move
    
    enum CodingKeys: String, CodingKey {
        case move
    }
}

struct Abilities: Codable, Identifiable {
    let id = UUID()
    let ability: Ability
    
    enum CodingKeys: String, CodingKey {
        case ability
    }
}
