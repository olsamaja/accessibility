//
//  UIColor+Dynamic.swift
//  Accessibility
//
//  Created by Olivier Rigault on 28/10/2021.
//

import UIKit

extension UIColor {
    
    /// Returns a dynamic colour used for foreground UI elements, such as labels.
    ///
    var dynamic: UIColor {
        
        let dark = self.brighter()
        let highContrast = self.darker()
        let darkHighContrast = self.brighter(by: UIColor.Constants.highContrastBrightnessAdjustment)
        
        return dynamicColors(light: self, highContrast: highContrast, dark: dark, darkHighContrast: darkHighContrast)
    }

    /// Returns a dynamic colour used for background UI elements, such as a section header background.
    ///
    var dynamicBackground: UIColor {
        
        let dark = self.darker()
        let highContrast = self.brighter()
        let darkHighContrast = self.darker(by: UIColor.Constants.highContrastBrightnessAdjustment)
        
        return dynamicColors(light: self, highContrast: highContrast, dark: dark, darkHighContrast: darkHighContrast)
    }
    
    /// Returns a dynamic colour based on user interface style and accessibility contrast setting.
    ///
    /// - parameter light: colour used for light mode and standard contrast
    /// - parameter highContrast: colour used for light mode and increased (high) contrast
    /// - parameter dark: colour used for dark mode and standard contrast
    /// - parameter darkHighContrast: colour used for dark mode and increased (high) contrast
    ///
    /// - Unspecified user interface style is treated as light mode
    /// - Unspecified accessibility contrast is treated as standard contrast
    ///
    private func dynamicColors(light: UIColor, highContrast: UIColor, dark: UIColor, darkHighContrast: UIColor) -> UIColor {
        return UIColor(dynamicProvider: {
            switch ($0.userInterfaceStyle, $0.accessibilityContrast) {
            case (.dark, .high):
                return darkHighContrast
            case (.dark, _):
                return dark
            case (_, .high):
                return highContrast
            default:
                return self
            }
        })
    }
}
