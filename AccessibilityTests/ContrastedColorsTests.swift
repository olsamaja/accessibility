//
//  ContrastedColorsTests.swift
//  AccessibilityTests
//
//  Created by Olivier Rigault on 26/10/2021.
//
//  WCAG Level AAA requires a contrast ratio of at least 7:1 for normal text and 4.5:1 for large text.
//  Large text is defined as 14 point (typically 18.66px) and bold or larger, or 18 point (typically 24px) or larger.
//
//  Contrast ratios can range from 1 to 21 (commonly written 1:1 to 21:1).
//
//  Sources:
//  - https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html#dfn-relative-luminance

import XCTest
import SwiftUI
@testable import Accessibility

class ContrastedColorsTests: XCTestCase {

    func testSectionHeaderColorPack() throws {
        try testContrastedColorPack(ColorPack.sectionHeader, "Section Header Color Pack")
    }

    func testOrangeAndWhiteShouldFail() throws {
        try testContrastedColors(Color.white, Color.orange, "Orange and white", shouldFail: true)
    }
}
