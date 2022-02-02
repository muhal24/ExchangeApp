//
//  ContentView.swift
//  ExchangeApp
//
//  Created by Muhammed Hanifi Alma on 1.02.2022.
//

import SwiftUI

extension Color {

    static let background = Color("background")
    static let backgroundAccent = Color("backgroundAccent")
    
    static let textBody = Color("textBody")
    static let textSecondary = Color("textSecondary")
    static let textStrong = Color("textStrong")
    static let textLight = Color("textLight")
    static let textMedium = Color("textMedium")
    static let keypadKey = Color("keypadKey")
    
    static let swapButton = Color("swapButton")
    static let swapButtonSecondary = Color("swapButtonSecondary")
    static let swapPrimary = Color("swapPrimary")
    static let swapSecondary = Color("swapSecondary")
    
    static let textPrimary = Color("textPrimary")
    
}

struct ContentView: View {

    @Environment(\.managedObjectContext) var managedObjectContext
    @State var showSplash = true
    
    var body: some View {
        
        ZStack {
            
            // Home
            HomeView()
                    .environment(\.managedObjectContext, managedObjectContext)
            
            
        }
        
    }
}

class ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
