//
//  TransactionsSectionView.swift
//  Accessibility
//
//  Created by Olivier Rigault on 26/10/2021.
//

import SwiftUI

struct TransactionsSectionView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width: 16)
            Text(title)
                .bold()
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            Spacer()
        }
        .listRowInsets(EdgeInsets())
        .background(Color.sectionHeader)
    }
}

struct TransactionsSectionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransactionsSectionView(title: "Section Header (light)")
                .sizeThatFitPreview(with: "Light Theme")
            TransactionsSectionView(title: "Section Header (dark)")
                .sizeThatFitPreview(with: "Dark Theme")
                .preferredColorScheme(.dark)
        }
    }
}
