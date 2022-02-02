//
//  HomeViewModel.swift
//  ExchangeApp
//
//  Created by Muhammed Hanifi Alma on 2.02.2022.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {

    var cancellationToken: Set<AnyCancellable?> = []
    var fetchedRates: Set<Rate> = []
    @Published private(set) var error: Error? = nil
    @Published private(set) var ratesFetched: Bool = false

    init() {
        fetchCurrencyRates()
    }

}

extension HomeViewModel {

    func reFetchCurrencyRates() {
        ratesFetched = false
        error = nil
        fetchCurrencyRates()
    }

    private func fetchCurrencyRates() {
        Currency.currencies.forEach { currency in
            getLatestRateForBase(base: currency.name)
        }
    }

    private func getLatestRateForBase(base: String) {
        cancellationToken.insert(ExchangeRatesService.request(.latest, parameters: ["base": base])
                .mapError({ (error) -> Error in
                    self.error = error
                    return error
                })
                .sink(receiveCompletion: { _ in },
                        receiveValue: { rate in
                            self.fetchedRates.insert(rate)
                            print("Returned rate: \(rate)")

                            if self.fetchedRates.count >= Currency.currencies.count {
                                self.ratesFetched = true
                            }
                        }))
    }

}

