//
//  UIColor+Dynamic.swift
//  Accessibility
//
//  Created by Olivier Rigault on 28/10/2021.
//

import UIKit


extension UIColor {
    
    var dynamic: UIColor {
        
        let dark = self.lighter()
        let highContrast = self.darker()
        let darkHighContrast = self.lighter(by: UIColor.Constants.highContrastBrightnessAdjustment)
        
        return dynamicColors(light: self, highContrast: highContrast, dark: dark, darkHighContrast: darkHighContrast)
    }

    var dynamicBackground: UIColor {
        
        let dark = self.darker()
        let highContrast = self.lighter()
        let darkHighContrast = self.darker(by: UIColor.Constants.highContrastBrightnessAdjustment)
        
        return dynamicColors(light: self, highContrast: highContrast, dark: dark, darkHighContrast: darkHighContrast)
    }
    
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
