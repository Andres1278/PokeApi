//
//  SideBar.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 4/07/23.
//

import SwiftUI

struct SideBar: View {
    
    @Binding var selectedOption: MenuOptions?
    
    var body: some View {
        List(
            MenuOptions.allCases,
            selection: $selectedOption
        ) { option in
            NavigationLink(value: option) {
                Label(option.title, systemImage: option.image)
                    .font(.system(size: 16, weight: .regular, design: .rounded))
            }
        }
    }
}

#Preview {
    NavigationSplitView {
        SideBar(selectedOption: .constant(.pokemons))
            .navigationTitle("Menu")
    } detail: {
        Text("Detail")
    }
}
