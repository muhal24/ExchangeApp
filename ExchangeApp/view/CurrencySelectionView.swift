//
//  CurrencySelectionView.swift
//  ExchangeApp
//
//  Created by Muhammed Hanifi Alma on 2.02.2022.
//

import SwiftUI

struct CurrencySelectionView: View {
    
    @Binding var showCurrencySelection: Bool
    @Binding var exchange: Exchange
    @Binding var selection: String
    
    private let currencies = Currency.currencySections
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 0) {
                
                List {

                    ForEach(currencies) { section in
                        Section(header:
                            Text(section.title)
                                .font(.system(
                                    size: ViewConstants.fontSmall,
                                    weight: .medium,
                                    design: .monospaced)
                                )
                                .foregroundColor(Color.textSecondary)
                                .padding(.top, section.title == "Asia" ? ViewConstants.medium : 0)
                        ) {
                            ForEach(section.currencies) { currency in
                                Button(action: {
                                    if self.selection == "primary" {
                                        self.exchange.primary = currency
                                    } else {
                                        self.exchange.secondary = currency
                                    }
                                    self.showCurrencySelection.toggle()
                                }) {
                                    CurrencySelectionRow(currency: currency)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
            }
            .navigationBarTitle(Text("SelectCurrency"))
            
        }
        
    }
}

struct CurrencySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelectionView(
            showCurrencySelection: .constant(true),
            exchange: .constant(
                Exchange(
                    primary: Currency(name: "", fullName: "", continent: .Asia),
                    secondary: Currency(name: "", fullName: "", continent: .Asia))),
            selection: .constant("primary"))
    }
}

