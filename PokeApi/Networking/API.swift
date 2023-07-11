//
//  API.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 9/07/23.
//

import Foundation

struct API {
    
    private static let baseUrl = "https://pokeapi.co/api/v2"
    let defaultRequestParameters = ["limit": "100"]
    
    enum Endpoint {
        case detail(name: String)
        case movesList
        case moveDetail(name: String)
        case abilitiesList
        case abilityDetail(name: String)
        case typeDetail(id: String)
        case `default`
        
        var path: String {
            switch self {
            case .detail(let name):
                return  "/pokemon/\(name)"
            case .movesList:
                return "/move"
            case .moveDetail(let name):
                return  "/move/\(name)"
            case .abilitiesList:
                return "/ability"
            case .abilityDetail(let name):
                return  "/ability/\(name)"
            case .typeDetail(let id):
                return  "/type/\(id)"
            case .default:
                return "/pokemon"
            }
        }
    }
    
    static func url(for endpoint: Endpoint) -> String {
        return baseUrl + endpoint.path
    }
}
