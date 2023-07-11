//
//  ItemView.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 5/07/23.
//

import SwiftUI

struct AbilitiesView: View {

    let items: [Abilities]
    
    var body: some View {
        VStack(spacing: 6) {
            Text("Abilities:")
                .font(.system(size: 18, weight: .regular, design: .monospaced))
            ForEach(items) { item in
                Text(item.ability.name)
                    .font(.system(size: 12, weight: .light, design: .monospaced))
            }
        }
    }
}

#Preview {
    AbilitiesView(items: [
        Abilities(ability: Ability(name: "Test Name", url: ""))
    ])
}
