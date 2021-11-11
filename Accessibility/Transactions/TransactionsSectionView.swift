//
//  TransactionsSectionView.swift
//  Accessibility
//
//  Created by Olivier Rigault on 26/10/2021.
//

import SwiftUI

struct TransactionsSectionView: View {
    
    let model: TransactionsSectionViewModel
    
    init(model: TransactionsSectionViewModel) {
        self.model = model
    }
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 16)
            Text(model.title)
                .foregroundColor(model.colors.foreground)
                .bold()
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            Spacer()
        }
        .listRowInsets(EdgeInsets())
        .background(model.colors.background)
    }
}

struct TransactionsSectionView_Previews: PreviewProvider {
    
    enum Constants {
        static let model1 = TransactionsSectionViewModel(title: "Section Header", colors: ColorPack.sectionHeader)
        static let model2 = TransactionsSectionViewModel(title: "Another Section Header", colors: ColorPack.sectionHeader)
    }
    
    static var previews: some View {
        Group {
            TransactionsSectionView(model: Constants.model1)
                .sizeThatFitPreview(with: "Light Theme")
            TransactionsSectionView(model: Constants.model2)
                .sizeThatFitPreview(with: "Dark Theme")
                .preferredColorScheme(.dark)
        }
    }
}
