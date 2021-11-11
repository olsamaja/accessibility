//
//  ColorPack.swift
//  Accessibility
//
//  Created by Olivier Rigault on 10/11/2021.
//

import SwiftUI

struct ColorPack {
    
    let foreground: Color
    let background: Color
    
    init(_ foreground: Color, _ background: Color) {
        self.foreground = foreground
        self.background =  background
    }
}

extension ColorPack {
    
    static var sectionHeader = ColorPack(.sectionHeaderForeground, .sectionHeaderBackground)
}
