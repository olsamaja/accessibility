//
//  RowModel.swift
//  Accessibility
//
//  Created by Olivier Rigault on 26/10/2021.
//

import SwiftUI

public struct RowModel: Identifiable {
    
    public var id = UUID().uuidString
    
    let type: Any
    let model: Any?
    
    init(type: Any, model: Any? = nil) {
        self.type = type
        self.model = model
    }
}

public struct SectionModel: Identifiable {
    
    public var id = UUID().uuidString
    
    let headerModel: RowModel?
    let rowModels: [RowModel]?
    
    init(header: RowModel? = nil, rows: [RowModel]? = nil) {
        self.headerModel = header
        self.rowModels = rows
    }
}
