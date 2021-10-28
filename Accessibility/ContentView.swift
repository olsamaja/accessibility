//
//  ContentView.swift
//  Accessibility
//
//  Created by Olivier Rigault on 26/10/2021.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            List {
                ForEach(Constants.sections) { section in
                    SectionRows(sectionModel: section)
                }
            }
            .navigationTitle("Transactions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDisplayName("Light Theme")
            ContentView()
                .previewDisplayName("Dark Theme")
                .preferredColorScheme(.dark)
        }
    }
}
