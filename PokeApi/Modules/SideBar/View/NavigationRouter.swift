//
//  NavigationRouter.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 4/07/23.
//

import Foundation
import SwiftUI

final class NavigationRouter: ObservableObject {
    
    @Published var routes = [Route]()
    @Published var selectedOption: MenuOptions?
//    @Published var selectedCategory: MenuCategory?
//    @Published var selectedItemId: String?
        
    func push(to screen: Route) {
        guard !routes.contains(screen) else {
            return
        }
        routes.append(screen)
    }
    
    func goBack() {
        _ = routes.popLast()
    }
    
    func reset() {
        routes = []
    }
    
    func replace(stack: [Route]) {
      routes = stack
    }
    
    func getRoute(for item: any Option) -> Route? {
        switch item {
        case is PokemonBase:
            return Route.option(item: item as! PokemonBase)
        case is AbilityBase:
            return Route.option(item: item as! AbilityBase)
        case is MoveBase:
            return Route.option(item: item as! MoveBase)
        default:
            return nil
        }
    }
}

enum Route {
    case option(item: any Option, hideTabBar: Bool = false)
}

protocol Option: Identifiable, Hashable {
    var name: String { get }
    var url: String { get }
    var id: UUID { get }
}
struct PokemonBase: Option, Codable, Identifiable, Equatable {
    var id = UUID()
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
    
    static var samplePokemon = PokemonBase(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}

struct AbilityBase: Option, Codable, Identifiable, Equatable  {
    var id = UUID()
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}

struct MoveBase: Option, Codable, Identifiable, Equatable {
    var id = UUID()
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}

extension Route: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.option(let lhsItem, _), .option(let rhsItem, _)):
            return lhsItem.id == rhsItem.id
        }
    }
    
}
