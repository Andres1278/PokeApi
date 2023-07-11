//
//  MovesView.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 9/07/23.
//

import SwiftUI

struct MovesView: View {
    
    let items: [Moves]
    
    var body: some View {
        VStack(spacing: 6) {
            Text("Moves:")
                .font(.system(size: 18, weight: .regular, design: .monospaced))
            ForEach(items) { item in
                Text(item.move.name)
                    .font(.system(size: 12, weight: .light, design: .monospaced))
            }
        }
    }
}

#Preview {
    MovesView(items: [Moves(move: Move(name: "Move Name", url: ""))])
}
