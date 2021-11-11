//
//  Color+Extensions.swift
//  Accessibility
//
//  Created by Olivier Rigault on 26/10/2021.
//

import SwiftUI

public extension Color {
    
    static var defaultBackround: Color { Color(UIColor.defaultBackround) }
    static var sectionHeaderForeground: Color { Color(UIColor.sectionHeaderForeground) }
    static var sectionHeaderBackground: Color { Color(UIColor.sectionHeaderBackground) }
    static var actionText: Color { Color(UIColor.actionText) }
}

public extension UIColor {
    
    static var defaultBackround: UIColor { systemBackground }
    static var sectionHeaderForeground: UIColor { black.dynamicColor(dark: white) }
    static var sectionHeaderBackground: UIColor { UIColor(hex: "0xfb8c00").autoDynamicBackground }
    static var actionText: UIColor { UIColor(hex: "0x008cff").autoDynamic }
}
