//
//  ExchangeDisplay.swift
//  ExchangeApp
//
//  Created by Muhammed Hanifi Alma on 2.02.2022.
//

import SwiftUI

struct ExchangeDisplay: View {
    
    @Binding var exchange: Exchange
    @Binding var showCurrencySelection: Bool
    @Binding var selection: String
    
    @State var swapped: Bool = false
    @State var offsetY: CGFloat = 0.0
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack{
                VStack(spacing: 0) {
                    
                    // Primary
                    HStack {
                        VStack {
                            Spacer()
                            ExchangeDisplayDetail(value: "\(self.exchange.primaryValueDisplay)", name: self.exchange.primary.fullName)
                                .onTapGesture() {
                                    self.openCurrencySelection("primary")
                                }
                                .offset(y: self.offsetY)
                        }
                        Spacer()
                    }
                    .background(Color.backgroundAccent)
                    
                    // Secondary
                    HStack {
                        VStack {
                            ExchangeDisplayDetail(value: "\(self.exchange.secondaryValueDisplay)", name: self.exchange.secondary.fullName)
                                .onTapGesture {
                                    self.openCurrencySelection("secondary")
                                }
                                .offset(y: -self.offsetY)
                            Spacer()
                        }
                        Spacer()
                    }
                    
                }
                
                // Swap Button
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        if !self.swapped {
                            self.offsetY = ViewConstants.swapOffset
                            self.swapped = true
                            self.exchange.swapped = true
                        } else {
                            self.offsetY = 0
                            self.swapped = false
                            self.exchange.swapped = false
                        }
                        self.exchange.resetToInitial()
                    }
                }) {
                    Image("exchange")
                        .frame(width: 24, height: 24)
                }
                .frame(
                    width: ViewConstants.swapButtonSize,
                    height: ViewConstants.swapButtonSize
                )
                .background(Color("swapPrimary"))
                .cornerRadius(ViewConstants.large)
                
            }
        }
        
    }
    
    func openCurrencySelection(_ selection: String) {
        self.selection = selection
        self.showCurrencySelection.toggle()
    }
    
}

struct ExchangeDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeDisplay(
            exchange: .constant(Exchange(
                primary: Currency(name: "NOK", fullName: "Norwegian Kroners", continent: .Europe),
                secondary: Currency(name: "USD", fullName: "United States Dollars", continent: .NorthAmerica)
            )),
            showCurrencySelection: .constant(false),
            selection: .constant("primary")
        )
        .background(Color.background)
    }
}

