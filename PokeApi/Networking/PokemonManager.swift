//
//  PokemonManager.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 9/07/23.
//

import Foundation
import os.log

enum PokemonListResponse {
    case success(response: PokemonPage?)
    case failure(Error?)
}

enum PokemonDetailResponse {
    case success(response: PokemonDetail?)
    case failure(Error?)
}

enum PokemonTypeResponse {
    case success(response: Types?)
    case failure(Error?)
}

enum PokemonAbilityResponse {
    case success(response: AbilityDetail?)
    case failure(Error?)
}

class PokemonManager {
    func getPokemons(completion: @escaping (PokemonListResponse) -> Void) {
        let parameters: [String:String] = ["limit":"200"]
        ServiceManger.request(to: API.url(for: .default), parameters:  parameters) { (result: ServiceManger.CompletionResult<PokemonPage>) in
            switch result {
            case .success(let list):
                os_log("[PokemonManager] getPokemonsList() Success", log: OSLog.network, type: .info)
                completion(.success(response: list))
            case .failure(let error):
                os_log("[PokemonManager] getPokemonsList() failure", log: OSLog.network, type: .info, error as CVarArg)
                completion(.failure(error))
            }
        }
    }
    
    func getPokemonDetail(with name: String, completion: @escaping (PokemonDetailResponse) -> Void) {
        ServiceManger.request(to: API.url(for: .detail(name: name))) { (result: ServiceManger.CompletionResult<PokemonDetail>) in
            switch result {
            case .success(let data):
                os_log("[PokemonManager] getPokemonDetail() Success", log: OSLog.network, type: .info)
                completion(.success(response: data))
            case .failure(let error):
                os_log("[PokemonManager] getPokemonDetail() failure", log: OSLog.network, type: .info, error as CVarArg)
                completion(.failure(error))
            }
        }
    }
    
    func getAbility(with name: String, completion: @escaping (PokemonAbilityResponse) -> Void) {
        ServiceManger.request(to: API.url(for: .abilityDetail(name: name))) { (result: ServiceManger.CompletionResult<AbilityDetail>)  in
            switch result {
            case .success(let data):
                os_log("[ServiceManger] getAbility() Success", log: OSLog.network, type: .info)
                completion(.success(response: data))
            case .failure(let error):
                os_log("[ServiceManger] getAbility() failure", log: OSLog.network, type: .info, error as CVarArg)
                completion(.failure(error))
            }
        }
    }
    
    func getPokemonType(with id: String, completion: @escaping (PokemonTypeResponse) -> Void) {
        ServiceManger.request(to: API.url(for: .typeDetail(id: id))) { (result: ServiceManger.CompletionResult<Types>)  in
            switch result {
            case .success(let data):
                os_log("[ServiceManger] getPokemonType() Success", log: OSLog.network, type: .info)
                completion(.success(response: data))
            case .failure(let error):
                os_log("[ServiceManger] getPokemonType() failure", log: OSLog.network, type: .info, error as CVarArg)
                completion(.failure(error))
            }
        }
    }
}

