//
//  ChartView.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/17/23.
//

import SwiftUI
import Charts

struct ChartView: View {
   let viewModel: CoinDetailsViewModel
    var body: some View {
       Chart {
          ForEach(viewModel.chartData) { dataItem in
             LineMark(x: .value("Date", dataItem.date), y: .value("Price", dataItem.value))
                .interpolationMethod(.cardinal)
          }
       }
       .chartXScale(domain: ClosedRange(uncheckedBounds: (lower: viewModel.startDate, upper: viewModel.endDate)))
       .chartYScale(domain: ClosedRange(uncheckedBounds: (lower: viewModel.minPrice, upper: viewModel.maxPrice)))
    }
}

struct Chart_Previews: PreviewProvider {
   static var previews: some View {
      ChartView(viewModel: CoinDetailsViewModel(coin: dev.coin))
   }
}

