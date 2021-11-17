//
//  ContrastedColorsTests+Extensions.swift
//  AccessibilityTests
//
//  Created by Olivier Rigault on 12/11/2021.
//

import XCTest
import SwiftUI
@testable import Accessibility

extension ContrastedColorsTests {
    
    enum Constants {
        static let minContrastRatio: CGFloat = 7
    }

    func testContrastedColorPack(_ colorPack: ColorPack, _ message: String = "") throws {
        try testContrastedColors(colorPack.foreground, colorPack.background, message)
    }

    func testContrastedColors(_ color1: Color, _ color2: Color, _ message: String = "", shouldFail: Bool? = false) throws {
        
        let contrastRatio = UIColor(color1).contrastRatio(with: UIColor(color2))
        
        print("\(message) contrast ratio = \(contrastRatio)")
        
        if let shouldFail = shouldFail, shouldFail {
            XCTAssertFalse(contrastRatio > Constants.minContrastRatio, "\(message) - Expected ratio ≤ \(Constants.minContrastRatio), but got \(contrastRatio) instead.")
        } else {
            XCTAssertTrue(contrastRatio > Constants.minContrastRatio, "\(message) - Expected ratio > \(Constants.minContrastRatio), but got \(contrastRatio) instead.")
        }
    }

}

extension UIColor {
    
    func contrastRatio(with anotherColor: UIColor) -> CGFloat {
        
        let luminances = [self, anotherColor].map { $0.relativeLuminance }
        let sortedLuminances = luminances.sorted()

        return (sortedLuminances[1] + 0.05) / (sortedLuminances[0] + 0.05)
    }
}

extension UIColor {
    
    enum Constants {
        static let redModifier: CGFloat = 0.2126
        static let greenModifier: CGFloat = 0.7152
        static let blueModifier: CGFloat = 0.0722
    }

    var relativeLuminance: CGFloat {
        
        var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) = (0.0, 0.0, 0.0, 0.0)
        guard getRed(&rgba.red, green: &rgba.green, blue: &rgba.blue, alpha: &rgba.alpha) else {
            return 0
        }
        
        let r = rgba.red.valueForLuminance
        let g = rgba.green.valueForLuminance
        let b = rgba.blue.valueForLuminance
        
        return (r * Constants.redModifier) + (g * Constants.greenModifier) + (b * Constants.blueModifier)
    }
}

extension CGFloat {
    
    enum Constants {
        static let minValue: CGFloat = 0.03928
        static let divider: CGFloat = 12.92
        static let modifier1: CGFloat = 0.055
        static let modifier2: CGFloat = 1.055
        static let modifier3: CGFloat = 2.4
    }
    
    var valueForLuminance: CGFloat {
        if self <= Constants.minValue {
            return self / Constants.divider
        } else {
            return pow((self + Constants.modifier1) / Constants.modifier2, Constants.modifier3)
        }
    }
}
