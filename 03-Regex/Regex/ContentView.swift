//
//  ContentView.swift
//  Regex
//
//  Created by Cruz Torres on 05/07/22.
//

import SwiftUI

struct ContentView: View {
    @State private var text = "soport@google.com #qwoieiewquewquieoqwueqw qwej #swift wehew ijhq wn dasjkdsahdsjah qiuh qweuh eqow #swiftbeta #wwdc22 swift@apple.com anojdfasofi swiftbeta.blog@gmail.com adodais js #swiftui adioadsa adsihadsusaduioas #meet sys@yahoo.com."
    @State private var hashTags = ""
    @State private var hashEmails = ""
    
    var body: some View {
        Form {
            Section {
                Text(text)
                Button("Get Hashtags") {
                    checkHashTags()
                }
                Button("Get Email")  {
                    checkHashEmails()
                }
            }
            Section {
                Text(hashTags)
            }
            Section {
                Text(hashEmails)
            }
        }
    }
    
    func checkHashTags() {
        let regex = try! Regex("#[a-z0-9]+")
        
        let match = text.matches(of: regex)
        match.forEach { value in
            let lowerBounds = value.range.lowerBound
            let upperBounds = value.range.upperBound
            let hashTag = text[lowerBounds...upperBounds]
            print(hashTag)
            hashTags.append(String(hashTag))
        }
    }
    
    func checkHashEmails() {
        let regex = /\b[\w\.-]+@[\w\.-]+\.\w{2,4}\b/
        
        let match = text.matches(of: regex)
        match.forEach { value in
            let lowerBounds = value.range.lowerBound
            let upperBounds = value.range.upperBound
            let hashEmail = text[lowerBounds...upperBounds]
            print(hashEmail)
            hashEmails.append(String(hashEmail))
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
