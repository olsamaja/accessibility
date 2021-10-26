//
//  Comparable+Extensions.swift
//  Accessibility
//
//  Created by Olivier Rigault on 26/10/2021.
//

import Foundation

extension Comparable {
    
    func clamped(from lowerBound: Self, to upperBound: Self) -> Self {
        return min(max(self, lowerBound), upperBound)
    }
}
