//
//  TransactionView.swift
//  Accessibility
//
//  Created by Olivier Rigault on 26/10/2021.
//

import SwiftUI

struct TransactionView: View {
    
    let title: String
    let subTitle: String
    let amount: String
    
    init(model: TransactionViewModel) {
        self.title = model.title
        self.subTitle = model.subTitle
        self.amount = model.amount
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title3)
                Text(subTitle)
                    .font(.footnote)
            }
            Spacer(minLength: 10)
            Text(amount)
                .font(.body)
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView(model: TransactionViewModel(title: "Title", subTitle: "Sub title", amount: "£12.95"))
            .sizeThatFitPreview(with: "Transaction")
    }
}
