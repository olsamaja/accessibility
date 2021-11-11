//
//  TransactionView.swift
//  Accessibility
//
//  Created by Olivier Rigault on 26/10/2021.
//

import SwiftUI

struct TransactionView: View {
    
    @Environment(\.sizeCategory) var sizeCategory

    let model: TransactionViewModel
    
    init(model: TransactionViewModel) {
        self.model = model
    }
    
    var body: some View {
        if sizeCategory > .extraExtraLarge {
            VStack(alignment: .leading) {
                HStack {
                    amountView
                    Spacer()
                    logoView
                }
                HStack {
                    titleAndSubTitleView
                    Spacer(minLength: 10)
                }
            }
        } else if sizeCategory > .extraLarge {
            VStack(alignment: .leading) {
                logoView
                HStack {
                    titleAndSubTitleView
                    Spacer(minLength: 10)
                    amountView
                }
            }
        } else {
            HStack {
                logoView
                titleAndSubTitleView
                Spacer(minLength: 10)
                amountView
            }
        }
    }
    
    private var logoView: some View {
        Image(systemName: "creditcard")
    }

    private var titleAndSubTitleView: some View {
        VStack(alignment: .leading) {
            Text(model.title)
                .font(.title3)
            Text(model.subTitle)
                .font(.footnote)
        }
    }
    
    private var amountView: some View {
        Text(model.amount)
            .font(.body)
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionView(model: TransactionViewModel(title: "Title", subTitle: "Sub title", amount: "£12.95"))
                .sizeThatFitPreview(with: "Default")
            TransactionView(model: TransactionViewModel(title: "Extra Extra Large Title", subTitle: "Sub title", amount: "£12.95"))
                .environment(\.sizeCategory, .extraExtraLarge)
                .sizeThatFitPreview(with: "Extra Extra Large Text")
            TransactionView(model: TransactionViewModel(title: "Extra Extra Extra Large Title", subTitle: "Sub title", amount: "£12.95"))
                .environment(\.sizeCategory, .extraExtraExtraLarge)
                .sizeThatFitPreview(with: "Extra Extra Large Text")
            TransactionView(model: TransactionViewModel(title: "This is a very long title for such a simple transaction", subTitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat", amount: "£1234.95"))
                .sizeThatFitPreview(with: "Dark")
                .preferredColorScheme(.dark)
        }
    }
}
