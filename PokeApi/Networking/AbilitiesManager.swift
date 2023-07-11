//
//  AbilitiesManager.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 9/07/23.
//

import Foundation
import OSLog

enum AbilitiesListResponse {
    case success(response: AbilityPage?)
    case failure(Error?)
}

class AbilitiesManager {
    
    func getAbilitiesList(completion: @escaping (AbilitiesListResponse) -> Void) {
        let parameters: [String:String] = ["limit":"100"]
        ServiceManger.request(to: API.url(for: .abilitiesList), parameters: parameters) { (result: ServiceManger.CompletionResult<AbilityPage>) in
            switch result {
            case .success(let data):
                os_log("[MovementsManager] getMovementList() Success", log: OSLog.network, type: .info)
                completion(.success(response: data))
            case .failure(let error):
                os_log("[MovementsManager] getMovementList() failure", log: OSLog.network, type: .info, error as CVarArg)
                completion(.failure(error))
            }
        }
    }
}
