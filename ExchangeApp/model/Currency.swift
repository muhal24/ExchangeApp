//
//  Currency.swift
//  ExchangeApp
//
//  Created by Muhammed Hanifi Alma on 1.02.2022.
//

import Foundation

struct Currency: Identifiable {

    enum Continent {
        case Asia
        case Europe
        case NorthAmerica
        case SouthAmerica
    }

    struct CurrencySection: Identifiable {
        var id: String {
            title
        }
        var title: String
        var currencies: [Currency]
    }

    var id: String {
        name
    }
    var name: String
    var fullName: String
    var continent: Continent

    static let currencySections: [CurrencySection] = [
  
        CurrencySection(
                title: "Asia".localized(),
                currencies: currencies.filter({ currency in
                    currency.continent == .Asia
                })),
        CurrencySection(
                title: "Europe".localized(),
                currencies: currencies.filter({ currency in
                    currency.continent == .Europe
                })),
        CurrencySection(
                title: "NorthAmerica".localized(),
                currencies: currencies.filter({ currency in
                    currency.continent == .NorthAmerica
                })),
        CurrencySection(
                title: "SouthAmerica".localized(),
                currencies: currencies.filter({ currency in
                    currency.continent == .SouthAmerica
                }))
    ]

    // MARK: Full currency array
    static let currencies: Array<Currency> = [
    
        Currency(name: "JPY", fullName: "JapaneseYen".localized(), continent: .Asia),
        Currency(name: "TRY", fullName: "TurkishLira".localized(), continent: .Asia),
        Currency(name: "DKK", fullName: "DanishKroner".localized(), continent: .Europe),
        Currency(name: "GBP", fullName: "GreatBritishPounds".localized(), continent: .Europe),
        Currency(name: "CAD", fullName: "CanadianDollars".localized(), continent: .NorthAmerica),
        Currency(name: "USD", fullName: "UnitedStatesDollars".localized(), continent: .NorthAmerica),
        Currency(name: "BRL", fullName: "BrazilianReal".localized(), continent: .SouthAmerica),
     
    ]

}

