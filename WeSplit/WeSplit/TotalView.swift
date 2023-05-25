//
//  TotalView.swift
//  WeSplit
//
//  Created by Harsh Verma on 24/05/23.
//

import SwiftUI

struct TotalView: View {
    var total: Double = 0.0
        var totalPerPerson: Double = 0.0
        var numberOfPeople: Int
        
        var showPeople: [String] {
            return [String](repeating: "💁", count: numberOfPeople)
        }
    var body: some View {
            VStack {
                HStack {
                    NumberView(number: totalPerPerson, label: "Total Per Person")
                    Divider()
                    NumberView(number: total, label: "Total")
                }
                .frame(height: 100)
                if total != 0.00 && totalPerPerson != 0.00 {
                    VStack(alignment: .leading) {
                        HStack {
                            ForEach(showPeople, id: \.self) { person in
                                Text(person)
                            }
                        }
                        ProgressView(value: totalPerPerson, total: total)
                    }.padding(.horizontal)
                }
            }
        }
}
