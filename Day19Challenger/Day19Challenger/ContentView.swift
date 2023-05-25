//
//  ContentView.swift
//  Day19Challenger
//
//  Created by Harsh Verma on 24/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var entry = ""
    @State private var inputSelected = 1 // index number
    @State private var outputSelected = 2 // index number
    @FocusState private var inputIsFocused: Bool
    
    let units: [String] = [
         "minutes",
         "hours",
         "days"
    ]
    
    
    var convertNumber: Double {
        let userEntry = Double(entry) ?? 0
        let result: Double
        let minutesInHour: Double = 60
        let minutesInDay = minutesInHour * 24
        
        
        let inputSelection = units[inputSelected]
        let outputSelection = units[outputSelected]
        
        let minutes = units[0]
        let hours = units[1]
        let days = units[2]
        
        
        switch(inputSelection, outputSelection) {
        case(minutes, hours):
            result = userEntry / minutesInHour
         case (minutes, days):
            result = userEntry / minutesInDay
         case (hours, days):
            result = userEntry * minutesInHour / minutesInDay
         case (hours, minutes):
            result = userEntry * minutesInHour
         case (days, minutes):
            result = userEntry * minutesInDay
         case (days, hours):
            result = userEntry * minutesInDay / minutesInHour
         default:
            result = userEntry
        }
        return result
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                
                //1st Section
                Section {
                    TextField("Number", text: $entry)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                    
                }
                
                // 2nd Section
                Section (header: Text("Input Unit")){
                    Picker("Input Unit", selection: $inputSelected) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }.pickerStyle(.segmented)
                }
                
                // 3rd Section
                Section(header: Text("Output Section")) {
                    Picker("Output", selection: $outputSelected) {
                        ForEach(units, id: \.self) { out in
                            Text(out)
                        }
                    }.pickerStyle(.segmented)
                }
                
                //4th Section
                
                Section(header: Text("Result")) {
                    Text("There are \(convertNumber, specifier: "%.2f") \(units[outputSelected]) in \(entry) \(units[inputSelected])")
                }
            }
            .navigationTitle("Time Traveler")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
