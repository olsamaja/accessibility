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
    static var sectionHeader: UIColor { .secondarySystemBackground }
    
    static var actionText: UIColor {
        return UIColor { (traitCollection: UITraitCollection) -> UIColor in
            Adaptative.actionText[traitCollection.interfaceStyle] ?? UIColor.purple
        }
    }
    
    enum Adaptative {
        static let actionText = UIColor(hex: "0xfb8c00").styleColors()
    }
}

extension UIColor {

    func styleColors() -> [InterfaceStyle: UIColor] {
        [.normal: self,
         .dark: self.lighter(),
         .highContrast: self.darker(),
         .darkHighContrast: self.lighter(by: UIColor.Constants.highContrastBrightnessAdjustment)]
    }
}

extension UITraitCollection {
    
    var interfaceStyle: InterfaceStyle {
        switch(userInterfaceStyle, accessibilityContrast) {
        case (.dark, .high):
            return .darkHighContrast
        case (.dark, _):
            return .dark
        case (_, .high):
            return .highContrast
        default:
            return .normal
        }
    }
}

enum InterfaceStyle {
    case normal
    case highContrast
    case dark
    case darkHighContrast
}
