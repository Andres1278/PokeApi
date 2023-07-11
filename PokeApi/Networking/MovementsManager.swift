//
//  MovementsManager.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 9/07/23.
//

import Foundation
import OSLog

enum MovementsListResponse {
    case success(response: MovementPage?)
    case failure(Error?)
}

enum MovementDetailResponse {
    case success(response: MovementDetail?)
    case failure(Error?)
}

class MovementsManager {
    
    func getMovementList(completion: @escaping (MovementsListResponse) -> Void) {
        let parameters: [String:String] = ["limit":"100"]
        ServiceManger.request(to: API.url(for: .movesList), parameters: parameters) { (result: ServiceManger.CompletionResult<MovementPage>) in
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
    
    func getMovementDetail(with name: String, completion: @escaping (MovementDetailResponse) -> Void) {
        ServiceManger.request(to: API.url(for: .moveDetail(name: name))) { (result: ServiceManger.CompletionResult<MovementDetail>)  in
            switch result {
            case .success(let data):
                os_log("[MovementsManager] getMovement() Success", log: OSLog.network, type: .info)
                completion(.success(response: data))
            case .failure(let error):
                os_log("[MovementsManager] getMovement() failure", log: OSLog.network, type: .info, error as CVarArg)
                completion(.failure(error))
            }
        }
    }
}
