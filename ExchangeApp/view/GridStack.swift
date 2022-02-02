//
//  GridStack.swift
//  ExchangeApp
//
//  Created by Muhammed Hanifi Alma on 2.02.2022.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content

    var body: some View {
        VStack(spacing: 0) {
            ForEach(0 ..< rows, id: \.self) { row in
                HStack(spacing: 0) {
                    ForEach(0 ..< self.columns, id: \.self) { column in
                        self.content(row, column)
                    }
                }
            }
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct GridStack_Previews: PreviewProvider {
    static var previews: some View {
        GridStack(rows: 4, columns: 3) { rows, columns in
            Text("0")
                .frame(width: 80, height: 80)
                .background(Color.blue)
        }
    }
}


