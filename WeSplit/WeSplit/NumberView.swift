//
//  NumberView.swift
//  WeSplit
//
//  Created by Harsh Verma on 24/05/23.
//

import SwiftUI

struct NumberView: View {
    var number: Double
    var label: String
    var body: some View {
        VStack {
            Text(number, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                .font(.largeTitle)
            
            Text(label)
                .font(.subheadline)
            
        }
        .padding()
    }
}

struct NumberViewPreview: PreviewProvider {
    static var previews: some View {
            NumberView(number: 50.00, label: "Total")
       }
}
