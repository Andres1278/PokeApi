//
//  PokeApiApp.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 29/06/23.
//

import SwiftUI

@main
struct PokeApiApp: App {
    @StateObject private var routerManager = NavigationRouter()
    @StateObject private var vm = PokemonsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(routerManager)
                .environmentObject(vm)
        }
    }
}
