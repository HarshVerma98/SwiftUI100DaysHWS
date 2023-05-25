//
//  Bill.swift
//  WeSplit
//
//  Created by Harsh Verma on 24/05/23.
//

import Foundation
struct Bill {
    var total = 0.0
    var totalPeople = 2
    var tipPercent = 20
    static let tipPercentages = [10,15,20,25,0]
    
    var calculateTotal: (amount: Double, amountPerPerson: Double) {
        let amount = total
        let tip = total * Double(tipPercent) / 100
        let grandTotal = amount + tip
        let totalPerPerson = grandTotal / Double(totalPeople)
        
        return (grandTotal, totalPerPerson)
    }
}
