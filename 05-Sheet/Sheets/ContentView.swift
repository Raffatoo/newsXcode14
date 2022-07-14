//
//  ContentView.swift
//  Sheets
//
//  Created by Cruz Torres on 07/07/22.
//

import SwiftUI

struct ContentView: View {
    @State var isActive: Bool = false
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack {
            Text("Usando Ventanas! ☎️ ")
                .font(isActive ? .largeTitle.weight(.heavy) : .headline)
                .foregroundStyle(isActive ? .black : .green)
                .padding(isActive ? 20 : 0)
                .background(isActive ? .orange : .clear)
                .cornerRadius(isActive ? 20 : 0)
                .onTapGesture { withAnimation { isActive.toggle() }}
            Button("Slide Sheet") {
                showSheet.toggle()
            }
            .padding(.top, 32)
        }
        .sheet(isPresented: $showSheet){
            Text("Nuevo Slide")
                .presentationDetents([.medium, .fraction(0.2)])
                .presentationDragIndicator(.hidden)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
