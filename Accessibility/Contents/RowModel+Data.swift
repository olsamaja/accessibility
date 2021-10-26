//
//  RowModel+Data.swift
//  Accessibility
//
//  Created by Olivier Rigault on 26/10/2021.
//

import SwiftUI

extension RowModel {
    
    enum Constants {
        static let transaction = TransactionViewModel(title: "Some merchant",
                                                      subTitle: "Transaction with no details",
                                                      amount: "£12.95")
        static let transactionRow = RowModel(type: TransactionView.self, model: transaction)
        static let section = RowModel(type: TransactionsSectionView.self)
        static let action = RowModel(type: ActionView.self)
    }
    
    static var sections = [
        SectionModel(header: Constants.section,
                     rows: [
                        Constants.transactionRow,
                        Constants.transactionRow,
                        Constants.transactionRow,
                        Constants.transactionRow
                    ]),
        SectionModel(header: Constants.section, rows: [RowModel](repeating: Constants.transactionRow, count: 6)),
        SectionModel(rows: [Constants.action])
    ]
}
