//
//  MovementsModel.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 6/07/23.
//

import Foundation


struct MovementPage: Codable {
    let count: Int
    let next: String
    let list: [MoveBase]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case list = "results"
    }
}

struct MovementDetail: Codable, Identifiable {
    
    let id = UUID()
    let name: String
    let accuracy: Int
    let numberOfUses: Int
    let power: Int
    let damageClass: BaseModel
    let effectEntries: [Effect]
    
    enum CodingKeys: String, CodingKey {
        case name
        case accuracy
        case numberOfUses = "pp"
        case power
        case damageClass = "damage_class"
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
