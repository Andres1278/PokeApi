//
//  AbilitiesModel.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 9/07/23.
//

import Foundation

struct AbilityPage: Codable {
    let count: Int
    let next: String
    let list: [AbilityBase]
    
    enum CodingKeys: String, CodingKey {
        case count
        case next
        case list = "results"
    }
}
