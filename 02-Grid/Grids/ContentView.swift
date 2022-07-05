//
//  ContentView.swift
//  Grids
//
//  Created by Cruz Torres on 05/07/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // Usando Grid esta puede ser personalizada, interno a esto usamos Grid Row
        
        Grid(horizontalSpacing: 10, verticalSpacing:20) {
            GridRow {
                Text("Fila 1")
                ForEach(0..<2) { _ in Circle().fill(.red.gradient) }
            }
            Divider()
            GridRow {
                Text("Fila 2")
                ForEach(0..<6) { _ in Circle().fill(.orange.gradient) }
            }
            Divider()
            GridRow {
                Text("Fila 3")
                ForEach(0..<4) { _ in Circle().fill(.purple.gradient) }
            }
            Divider()
            GridRow {
                Text("Fila 4")
                ForEach(0..<5) { _ in Circle().fill(.green.gradient) }
            }
            Divider()
            GridRow {
                Text("Fila 5")
                ForEach(0..<3) { _ in Circle().fill(.yellow.gradient) }
            }
        }
        .frame(height: 200)
        .padding(.horizontal)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
