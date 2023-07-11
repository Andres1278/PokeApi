//
//  AbilitiesListView.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 9/07/23.
//

import SwiftUI

struct AbilitiesListView: View {
    
    @EnvironmentObject private var viewModel: AbilitiesViewModel
    
    var body: some View {
        List(viewModel.filteredAbilities, id: \.id) { ability in
            NavigationLink(destination:
                Text(ability.name.capitalized)
                    .font(.system(size: 26, weight: .regular, design: .monospaced))
            ) {
                AbilitySingleListView(ability: ability)
            }
        }
        .searchable(
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(displayMode: .always)
        )
    }
}

#Preview {
    AbilitiesListView()
        .environmentObject(AbilitiesViewModel())
}
