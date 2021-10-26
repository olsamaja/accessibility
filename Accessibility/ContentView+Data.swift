//
//  ContentView+Data.swift
//  Accessibility
//
//  Created by Olivier Rigault on 26/10/2021.
//

import Foundation

extension ContentView {
    
    enum Constants {
        static let transaction = TransactionViewModel(title: "Some merchant",
                                                      subTitle: "Transaction with no details",
                                                      amount: "£12.95")
        static let row = RowModel(type: TransactionView.self, model: transaction)
        static let header = RowModel(type: TransactionsSectionView.self)
        static let action = RowModel(type: ActionView.self)
        static let section = SectionModel(header: header, rows: [row, row, row])
        static let lastSection = SectionModel(rows: [action])
        static let sections = [section, section, lastSection]
    }
    
}
