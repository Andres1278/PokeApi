//
//  MockPokemonManager.swift
//  PokeApiTests
//
//  Created by Pedro Andres Villamil on 9/07/23.
//

import Foundation
@testable import PokeApi


class MockServiceManager {
    
    func getPokemonList(completion: @escaping (PokemonListResponse) -> Void) {
        
        guard let jsonData = readLocalJsonFile(with: "PokemonMockList") else {
            completion(.failure(ServiceManger.NetworkError.noJSONData))
            return
        }
        do {
            let response = try  JSONDecoder().decode(PokemonPage.self, from: jsonData)
            completion(.success(response: response))
        } catch let error {
            print(error)
            completion(.failure(ServiceManger.NetworkError.JSONDecoder))
        }
    }
    
    func getPokemonDetail(completion: @escaping (PokemonDetailResponse) -> Void) {
        guard let jsonData = readLocalJsonFile(with: "PokemonDetailMock") else {
            completion(.failure(ServiceManger.NetworkError.noJSONData))
            return
        }
        do {
            let response = try  JSONDecoder().decode(PokemonDetail.self, from: jsonData)
            completion(.success(response: response))
        } catch let error {
            print(error)
            completion(.failure(ServiceManger.NetworkError.JSONDecoder))
        }
    }
    
    func getMovementsList(completion: @escaping (MovementsListResponse) -> Void) {
        guard let jsonData = readLocalJsonFile(with: "MovementsMockList") else {
            completion(.failure(ServiceManger.NetworkError.noJSONData))
            return
        }
        do {
            let response = try  JSONDecoder().decode(MovementPage.self, from: jsonData)
            completion(.success(response: response))
        } catch let error {
            print(error)
            completion(.failure(ServiceManger.NetworkError.JSONDecoder))
        }
    }
    
    func getAbilitiesList(completion: @escaping (AbilitiesListResponse) -> Void) {
        guard let jsonData = readLocalJsonFile(with: "AbilitiesMockList") else {
            completion(.failure(ServiceManger.NetworkError.noJSONData))
            return
        }
        do {
            let response = try  JSONDecoder().decode(AbilityPage.self, from: jsonData)
            completion(.success(response: response))
        } catch let error {
            print(error)
            completion(.failure(ServiceManger.NetworkError.JSONDecoder))
        }
    }
    
    private func readLocalJsonFile(with name: String) -> Data? {
        do {
            guard let fileUrl = Bundle.main.url(forResource: name, withExtension: "json") else {
                return nil
            }
            let data = try Data(contentsOf: fileUrl)
            return data
        } catch let error {
            print(error.localizedDescription)
            return nil
        }
    }
}
