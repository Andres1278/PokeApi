//
//  MovementListView.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 9/07/23.
//

import SwiftUI

struct MovementListView: View {
    
    @EnvironmentObject private var viewModel: MovementsViewModel
    
    var body: some View {
        
        List(viewModel.filteredMovement, id: \.id) { movement in
            NavigationLink(destination:
                Text(movement.name.capitalized)
                    .font(.system(size: 26, weight: .regular, design: .monospaced))
            ) {
                MovementSingleListView(movement: movement)
            }
        }
        .searchable(
            text: $viewModel.searchText,
            placement: .navigationBarDrawer(displayMode: .always)
        )
    }
}

#Preview {
    MovementListView()
        .environmentObject(MovementsViewModel())
}
