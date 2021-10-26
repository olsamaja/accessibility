//
//  BuilderProtocol.swift
//  Accessibility
//
//  Created by Olivier Rigault on 26/10/2021.
//

import Foundation

public protocol BuilderProtocol {
    
    associatedtype T
    
    func build() -> T
}
