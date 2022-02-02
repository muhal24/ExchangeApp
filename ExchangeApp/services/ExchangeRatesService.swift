//
//  ExchangeRatesService.swift
//  ExchangeApp
//
//  Created by Muhammed Hanifi Alma on 2.02.2022.
//

import Foundation
import Combine

enum ExchangeRatesService {
    static let apiClient = ApiClient()
    static let baseUrl = URL(string: "https://api.exchangeratesapi.io")!
}

enum ApiPath: String {
    case latest = "/latest?base=USD"
}

extension ExchangeRatesService {

    static func request(_ path: ApiPath, parameters: [String: String]? = nil) -> AnyPublisher<Rate, Error> {

        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
                else { fatalError("Couldn't create URLComponents") }

        if let parameters = parameters {
            components.queryItems = parameters.map { key, value -> URLQueryItem in
                return URLQueryItem(name: key, value: value)
            }
        }

        guard let url = components.url else {
            fatalError("Couldn't create URL")
        }

        return apiClient.run(URLRequest(url: url))
            .map(\.value)
            .eraseToAnyPublisher()

    }

}

