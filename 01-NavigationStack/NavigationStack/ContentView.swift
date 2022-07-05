//
//  ContentView.swift
//  NavigationStack
//
//  Created by Cruz Torres on 23/06/22.
//

import SwiftUI

// Creamos una estructura
struct Fruit: Hashable, Identifiable {
    var id = UUID()
    var name: String
    var color: String
}

// Creamos la entrada de datos
var fruits: [Fruit] = [
    .init(name: " 🍊 Orange", color: "Orange"),
    .init(name: " 🍋 Lemon", color: "Yellow"),
    .init(name: " 🍌 Banana", color: "Yellow"),
    .init(name: " 🍎 Apple", color: "Red"),
    .init(name: " 🍒 Cherries", color: "Red"),
    .init(name: " 🍓 Strawberry", color: "Pink"),
    .init(name: " 🍉 Watermelon", color: "Gren and Red"),
    .init(name: " 🫐 Blueberries", color: "Blue"),
    .init(name: " 🍇 Grape", color: "Purple"),
    .init(name: " 🍐 Pear", color: "Red"),
    .init(name: " 🥥 Coconut", color: "White")
]

struct Developer: Hashable, Identifiable {
    var id = UUID()
    var image: String
    let name: String
    let code: String
}

var developers: [Developer] = [
    .init(image: "💻 laptopcomputer", name: " 💻 C#", code: "Backend Dev"),
    .init(image: "📱 laptopcomputer", name: " 📱 Swift", code: "Movil Dev"),
    .init(image: "🖥 laptopcomputer", name: " 🖥 CSS", code: "Fronten Dev")
]

// Usando el navigationStack, ahora con la posibilidad de usar un parametro que nos permitira ver una vista seleeccionada.

struct ContentView: View {
    
    //@State private var path = [fruits[7], fruits[0]]
    //@State private var path = [developers[2], developers[0]]
    
    //para hacer uso de diferentes instancias (fruits & developers) hacemos uso de NavigationPath
    @State private var path = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path){
            
                Form {
                    Section {
                        List(developers){ developer in
                            NavigationLink(developer.name, value: developer)
                        }
                    }
                    
                    Section {
                        List(fruits){ fruit in
                            NavigationLink(fruit.name, value: fruit)
                        }
                    }
                }
                
                .navigationDestination(for: Developer.self) { developer in
                    Text(developer.name)
                    Text(developer.code)
                }
            
                .navigationDestination(for: Fruit.self) { fruit in
                    Text(fruit.name)
                    Text(fruit.color)
                }
                .navigationTitle("Sections")
            }
        .onAppear {
            path = NavigationPath([fruits[7], fruits[0]])
            path = NavigationPath([developers[1]])
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
