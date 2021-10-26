//
//  ContentRow.swift
//  Accessibility
//
//  Created by Olivier Rigault on 26/10/2021.
//

import SwiftUI

struct Row: View {

    let rowModel: RowModel
    
    init(model: RowModel) {
        self.rowModel = model
    }

    var body: some View {
        Row.makeRowView(with: rowModel)
    }
    
    static private func makeRowView(with rowModel: RowModel) -> some View {
        switch rowModel.type.self {
        case is TransactionsSectionView.Type:
            return AnyView( TransactionsSectionView(title: "20th May, 2021") )
        case is ActionView.Type:
            return AnyView( ActionView(title: "Show More") )
        case is TransactionView.Type:
            guard let model = rowModel.model as? TransactionViewModel else {
                return AnyView(EmptyView())
            }
            return AnyView(TransactionView(model: model))
        default: return AnyView(EmptyView())
        }
    }
}

public class ContentRowBuilder: BuilderProtocol {
    
    private var rowModel: RowModel?

    public func withModel(_ rowModel: RowModel) -> ContentRowBuilder {
        self.rowModel = rowModel
        return self
    }
    
    @ViewBuilder
    public func build() -> some View {
        if let rowModel = rowModel {
            Row(model: rowModel)
        } else {
            AnyView(EmptyView())
        }
    }
}

struct ContentRowBuilder_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentRowBuilder()
                .withModel(RowModel(type: TransactionsSectionView.self))
                .build()
                .sizeThatFitPreview(with: "Section Header")
            ContentRowBuilder()
                .withModel(RowModel(type: TransactionView.self,
                                    model: TransactionViewModel(title: "Title", subTitle: "Subtitle", amount: "£1,2345.00")))
                .build()
                .sizeThatFitPreview(with: "Transaction")
            ContentRowBuilder()
                .withModel(RowModel(type: ActionView.self))
                .build()
                .sizeThatFitPreview(with: "Action")
        }
    }
}
