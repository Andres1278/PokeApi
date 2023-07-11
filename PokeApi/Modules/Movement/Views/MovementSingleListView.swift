//
//  MovementSingleListView.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 9/07/23.
//

import SwiftUI

struct MovementSingleListView: View {
    
    let movement: MoveBase
    
    var body: some View {
        Text(movement.name.capitalized)
            .font(.system(size: 18, weight: .regular, design: .monospaced))
    }
}

#Preview {
    MovementSingleListView(movement: MoveBase(name: "", url: ""))
}
