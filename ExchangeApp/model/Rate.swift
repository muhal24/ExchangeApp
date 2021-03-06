//
//  Rate.swift
//  ExchangeApp
//
//  Created by Muhammed Hanifi Alma on 1.02.2022.
//

import Foundation

struct Rate: Codable, Hashable {

    let id: UUID = UUID()
    var base: String
    var date: String
    var rates: [String: Decimal]

    private enum CodingKeys: String, CodingKey {
        case base, date, rates
    }

}

extension Rate {

    /// Converts from a managed object directly to a Rate object
    static func managedRateAsRate(rate: ManagedRate, currencyRates: [ManagedCurrencyRate]) -> Rate {
        Rate(
            base: rate.base ?? "",
            date: "",
            rates: Dictionary(
                uniqueKeysWithValues: currencyRates.map {
                    ($0.name ?? "", Decimal(Double(truncating: $0.value ?? 0.0)))
                }
            )
        )
    }

}

