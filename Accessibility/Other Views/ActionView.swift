//
//  ActionView.swift
//  Accessibility
//
//  Created by Olivier Rigault on 26/10/2021.
//

import SwiftUI

struct ActionView: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(Color.actionText)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .listRowInsets(EdgeInsets())
            .background(Color.defaultBackround)
    }
}

struct ActionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ActionView(title: "Extra Extra Extra Large")
                .sizeThatFitPreview(with: "Light Theme")
                .environment(\.sizeCategory, .extraExtraExtraLarge)
            ActionView(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                .sizeThatFitPreview(with: "Dark Theme")
                .preferredColorScheme(.dark)
        }
    }
}
