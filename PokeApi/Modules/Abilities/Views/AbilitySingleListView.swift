//
//  AbilitySingleListView.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 9/07/23.
//

import SwiftUI

struct AbilitySingleListView: View {
    
    let ability: AbilityBase
    
    var body: some View {
        Text(ability.name.capitalized)
            .font(.system(size: 18, weight: .regular, design: .monospaced))
    }
}

#Preview {
    AbilitySingleListView(ability: AbilityBase(name: "", url: ""))
}
