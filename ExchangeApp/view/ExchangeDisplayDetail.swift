//
//  ExchangeDisplayDetail.swift
//  ExchangeApp
//
//  Created by Muhammed Hanifi Alma on 2.02.2022.
//

import SwiftUI

struct ExchangeDisplayDetail: View {
    let value: String
    let name: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(value)")
                .font(.system(
                    size: ViewConstants.primaryDisplaySize,
                    weight: .medium,
                    design: .monospaced)
                )
                .foregroundColor(Color.textPrimary)
            HStack {
                Text("\(name)")
                    .font(.system(
                        size: ViewConstants.primaryDisplayNameSize,
                        weight: .light,
                        design: .monospaced)
                    )
                    .foregroundColor(Color.textBody)
                Spacer()
                Image(systemName: "chevron.right")
                    .resizable()
                    .foregroundColor(Color.textSecondary)
                    .frame(width: ViewConstants.displayChevronWidth, height: ViewConstants.displayChevronHeight)
            }
        }
        .padding(ViewConstants.large)
        .padding(.bottom, ViewConstants.swapButtonPadding)
        .padding(.top, ViewConstants.swapButtonPadding)
    }
}

struct ExchangeDisplayDetail_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeDisplayDetail(value: "0", name: "Norwegian Kroners")
    }
}
