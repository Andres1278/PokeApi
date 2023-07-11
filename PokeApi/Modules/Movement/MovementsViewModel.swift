//
//  MovementsViewModel.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 9/07/23.
//

import Foundation


class MovementsViewModel: ObservableObject {
    
    private let movemensManager = MovementsManager()
    
    @Published var movementsList = [MoveBase]()
    @Published var movementDetail: MovementDetail?
    @Published var searchText = ""
    @Published private(set) var action: Action?
    
    // Used with searchText to filter pokemon results
    var filteredMovement: [MoveBase] {
        return searchText == "" ? movementsList : movementsList.filter { $0.name.contains(searchText.lowercased()) }
    }
    
    enum Action {
        case loading
        case finished
    }
    
    
    init() {
        action = .loading
        movemensManager.getMovementList { response in
            self.action = .finished
            switch response {
            case .success(let data):
                self.movementsList = data?.list ?? []
            case .failure(let error):
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    func getMovementIndex(movement: MoveBase) -> Int {
        if let index = self.movementsList.firstIndex(of: movement) {
            return index + 1
        }
        return 0
    }
    
    func getDetails(with name: String) {
        movementDetail = nil
        movemensManager.getMovementDetail(with: name) { response in
            switch response {
            case .success(let data):
                self.movementDetail = data
            case .failure(let error):
                print(error?.localizedDescription as Any)
            }
        }
    }
}
