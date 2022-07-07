//
//  ContentView.swift
//  MultiDatePicker
//
//  Created by Cruz Torres on 06/07/22.
//

import SwiftUI

struct ContentView: View {
    @State var selectedDates: Set<DateComponents> = []
    @State var finalDates: String = ""
    let url = URL(string:"https://www.swiftbeta.com")!
    
    var body: some View {
        Form {
            MultiDatePicker(selection: $selectedDates, in: .now... ) {
                    Label("Escoge una fecha",
                    systemImage: "calendar.badge.plus")
                }
            .onChange(of: selectedDates) { _ in
                getDatesFormatted()
            }
            
            Text(finalDates)
        
        }
        ShareLink("¡Revisa Lección!",
                  item: url,
                  subject: Text("Fechas de Cita"),
                  message: Text(finalDates)
            )
    }
    
    func getDatesFormatted() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/YY"
        
        let dates = selectedDates
            .compactMap{ Calendar.current.date(from:$0) }
            .map { formatter.string(from: $0) }
        finalDates = dates.joined(separator: "\n")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
