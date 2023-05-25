//
//  ContentView.swift
//  WeSplit
//
//  Created by Harsh Verma on 23/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var bill = Bill()
    @State private var progress = 5.0
    @FocusState private var isFocused: Bool
   
    
    var body: some View {
        NavigationView {
            VStack {
                TotalView(total: bill.calculateTotal.amount, totalPerPerson: bill.calculateTotal.amountPerPerson ,numberOfPeople: bill.totalPeople)
                    .foregroundColor(bill.tipPercent == 0 ? .red : .primary)
                
                
                Form {
                    Section(header: Text("Basics")) {
                        TextField("Amount", value: $bill.total, format: .currency(code: "USD"))
                            .keyboardType(.decimalPad)
                            .focused($isFocused)
                        
                        Stepper("\(bill.totalPeople) people", value: $bill.totalPeople, in: 2...100)
                        
                        Picker("Tip", selection: $bill.tipPercent) {
                            ForEach(Bill.tipPercentages, id: \.self) { tip in
                                Text(tip, format: .percent)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                }
                
            }
            
            .navigationTitle("We Split")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
            
        }
    }
}

//MARK: - Preview Structs
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


/* 1st step*/
//        NavigationView {
//            Form {
//                Section {
//                    Text("Person 1")
//                    Text("WatchOS")
//                    Text("Web App")
//                }
//                Section {
//
//                        Text("PBC")
//                        Text("ARM64")
//
//
//                }
//            }
//            .navigationTitle("We Split")
//            .navigationBarTitleDisplayMode(.large)
//        }
//

/* 2nd step*/

//        @State var tapCount = 0
//        Button("Tap Count: \(tapCount)") {
//            tapCount += 1
//        }.textCase(.uppercase)


/* 3rd step*/

//
//Form {
//    TextField("Enter Your name", text: $name)
//    Text("Hello \(name)")
//
//}


/* 4th step */
//@State var SelectedName: String = "Ron"
//let students = ["Harry", "Ron", "Ginny", "Fred"]
//NavigationView {
//    Form {
//        Picker("Choose your Students", selection: $SelectedName) {
//            ForEach(students, id: \.self) {
//                Text($0)
//            }
//        }
//    }
//    .navigationTitle("Hogwards School")
//    .navigationBarTitleDisplayMode(.automatic)
//}
