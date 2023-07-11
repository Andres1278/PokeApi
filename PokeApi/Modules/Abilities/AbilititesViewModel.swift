//
//  AbilititesViewModel.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 9/07/23.
//

import Foundation

class AbilitiesViewModel: ObservableObject {
    
    private let abilititesManager = AbilitiesManager()
    
    @Published var abilititeList = [AbilityBase]()
    @Published var searchText = ""
    @Published private(set) var action: Action?
    
    // Used with searchText to filter pokemon results
    var filteredAbilities: [AbilityBase] {
        return searchText == "" ? abilititeList : abilititeList.filter { $0.name.contains(searchText.lowercased()) }
    }
    
    enum Action {
        case loading
        case finished
    }
    
    
    init() {
        action = .loading
        abilititesManager.getAbilitiesList { response in
            self.action = .finished
            switch response {
            case .success(let data):
                self.abilititeList = data?.list ?? []
            case .failure(let error):
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    func getAbilitieIndex(ability: AbilityBase) -> Int {
        if let index = self.abilititeList.firstIndex(of: ability) {
            return index + 1
        }
        return 0
    }
}
