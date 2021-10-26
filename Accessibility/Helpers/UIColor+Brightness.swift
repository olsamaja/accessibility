//
//  UIColor+Brightness.swift
//  Accessibility
//
//  Created by Olivier Rigault on 26/10/2021.
//

import UIKit

extension UIColor {
    
    enum Constants {
        static let defaultBrightnessAdjustment: CGFloat = 0.3
        static let highContrastBrightnessAdjustment: CGFloat = 0.2
    }
    
    func lighter(by value: CGFloat = Constants.defaultBrightnessAdjustment) -> UIColor {
        let clamped = value.clamped(from: 0, to: 1)
        return adjustBrightness(by: clamped)
    }
    
    func darker(by value: CGFloat = Constants.defaultBrightnessAdjustment) -> UIColor {
        let clamped = value.clamped(from: 0, to: 1)
        return adjustBrightness(by: -clamped)
    }

    private func adjustBrightness(by value: CGFloat) -> UIColor {
        var hsva: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) = (0.0, 0.0, 0.0, 0.0)
        guard getHue(&hsva.hue, saturation: &hsva.saturation, brightness: &hsva.brightness, alpha: &hsva.alpha) else {
            return UIColor.red
        }
        hsva.brightness += hsva.brightness * value
        return UIColor(hue: hsva.hue, saturation: hsva.saturation, brightness: hsva.brightness, alpha: hsva.alpha)
    }
}
