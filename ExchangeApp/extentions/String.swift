//
//  String.swift
//  ExchangeApp
//
//  Created by Muhammed Hanifi Alma on 1.02.2022.
//

import Foundation

extension String {


    func localized(withComment comment: String? = nil) -> String {
        NSLocalizedString(self, comment: comment ?? "")
    }

}
