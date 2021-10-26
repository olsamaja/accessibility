//
//  SectionRows.swift
//  Accessibility
//
//  Created by Olivier Rigault on 26/10/2021.
//

import SwiftUI

struct SectionRows: View {
    
    let sectionModel: SectionModel
    
    var body: some View {
        if let headerModel = sectionModel.headerModel {
            Section(header: contentRow(headerModel)) {
                if let rowModels = sectionModel.rowModels {
                    contentRows(rowModels)
                }
            }
            .textCase(nil)
        } else if let rowModels = sectionModel.rowModels {
            contentRows(rowModels)
        }
    }
    
    private func contentRow(_ rowModel: RowModel) -> some View {
        ContentRowBuilder()
            .withModel(rowModel)
            .build()
    }
    
    private func contentRows(_ rowModels: [RowModel]) -> some View {
        ForEach(rowModels) { model in
            contentRow(model)
        }
    }
}

struct SectionRows_Previews: PreviewProvider {
    
    enum Constants {
        static let transaction = TransactionViewModel(title: "Some merchant",
                                                      subTitle: "Transaction with no details",
                                                      amount: "£12.95")
        static let transactionRow = RowModel(type: TransactionView.self, model: transaction)
        static let section = RowModel(type: TransactionsSectionView.self)
        static let action = RowModel(type: ActionView.self)
    }
    
    static var previews: some View {
        Group {
            SectionRows(sectionModel: SectionModel())
                .previewDisplayName("No sections, nor rows")
            SectionRows(sectionModel:
                            SectionModel(header: RowModel(type: TransactionsSectionView.self)))
                .sizeThatFitPreview(with: "Section header, no rows")
            SectionRows(sectionModel:
                            SectionModel(rows: [Constants.transactionRow, Constants.transactionRow]))
                .sizeThatFitPreview(with: "Rows, no section header")
            SectionRows(sectionModel:
                            SectionModel(header: RowModel(type: TransactionsSectionView.self),
                                         rows: [Constants.transactionRow, Constants.transactionRow]))
                .sizeThatFitPreview(with: "Section header and rows")
        }
    }
}
