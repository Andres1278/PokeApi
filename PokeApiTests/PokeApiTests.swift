//
//  PokeApiTests.swift
//  PokeApiTests
//
//  Created by Pedro Andres Villamil on 29/06/23.
//

import XCTest
@testable import PokeApi

final class PokeApiTests: XCTestCase {

    func testGetPokemonList() {
        let sut = MockServiceManager()
        var pokemonsData: PokemonPage?
        sut.getPokemonList { response in
            switch response {
            case .success(let data):
                pokemonsData = data
            case .failure(let error):
                print(error?.localizedDescription as Any)
            }
        }
        XCTAssertEqual(pokemonsData?.list.count, 151)
    }
    
    func testGetPokemonDetail() {
        let sut = MockServiceManager()
        var pokemonDetail: PokemonDetail?
        sut.getPokemonDetail { response in
            switch response {
            case .success(let data):
                pokemonDetail = data
            case .failure(let error):
                print(error?.localizedDescription as Any)
            }
        }
        XCTAssertEqual(pokemonDetail?.name , "bulbasaur")
    }
    
    func testGetMovementsList() {
        let sut = MockServiceManager()
        var movementsData: MovementPage?
        sut.getMovementsList { response in
            switch response {
            case .success(let data):
                movementsData = data
            case .failure(let error):
                print(error?.localizedDescription as Any)
            }
        }
        XCTAssertEqual(movementsData?.list.count , 100)
    }
    
    func testGetAbilitiesList() {
        let sut = MockServiceManager()
        var abilititesData: AbilityPage?
        sut.getAbilitiesList{ response in
            switch response {
            case .success(let data):
                abilititesData = data
            case .failure(let error):
                print(error?.localizedDescription as Any)
            }
        }
        XCTAssertEqual(abilititesData?.list.count , 100)
    }
}
