//
//  Color+Extensions.swift
//  Accessibility
//
//  Created by Olivier Rigault on 26/10/2021.
//

import SwiftUI

public extension Color {
    
    static var defaultBackround: Color { Color(UIColor.defaultBackround) }
    static var sectionHeader: Color { Color(UIColor.sectionHeader) }
    static var actionText: Color { Color(UIColor.actionText) }
}

public extension UIColor {
    
    static var defaultBackround: UIColor { .systemBackground }
    static var sectionHeader: UIColor { UIColor(hex: "0x008cff").dynamicBackground }
    static var actionText: UIColor { UIColor(hex: "0xfb8c00").dynamic }
}
