//
//  SwiftUIPrevie+Device.swift
//  PokeApi
//
//  Created by Pedro Andres Villamil on 4/07/23.
//

import Foundation
import SwiftUI

struct DevicePreviewModifier: ViewModifier {
    
    enum Device {
        case iPhone
        case iPad
    }
    
    let device: Device
    
    func body(content: Content) -> some View {
        switch device {
        case .iPhone:
            content.previewDisplayName("iPhone")
                .previewDevice("iPhone 14 Pro")
                .previewInterfaceOrientation(.portrait)
        case .iPad:
            content.previewDisplayName("iPad")
                .previewDevice("iPad Pro (12.9-inch) (6th generation)")
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}

extension View {
    func preview(for device: DevicePreviewModifier.Device) -> some View {
        self.modifier(DevicePreviewModifier(device: device))
    }
}
