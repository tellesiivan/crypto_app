//
//  StatisticView.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/14/23.
//

import SwiftUI

struct StatisticView: View {
    var body: some View {
       VStack(alignment: .leading, spacing:4){
          Text("Current Price")
             .font(.caption)
          Text("$82,033")
             .font(.headline)
          HStack(spacing:4) {
             Image(systemName: "triangle.fill")
                .font(.caption)
                Text("1.23%")
                .font(.caption)
                .bold()
          }
          .foregroundStyle(.green)
       }
    }
}

#Preview {
    StatisticView()
}
