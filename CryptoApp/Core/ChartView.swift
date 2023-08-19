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
                .foregroundStyle(viewModel.chartlineColor)
          }
       }
       .chartXScale(domain: ClosedRange(uncheckedBounds: (lower: viewModel.startDate, upper: viewModel.endDate)))
       .chartXAxis {
          AxisMarks(position: .bottom, values: viewModel.xAxisValues) {xVal in
             AxisGridLine()
             AxisValueLabel() {
                if let dateVal = xVal.as(Date.self) {
                   Text(dateVal.asShortDateString())
                }
             }
          }
       }
       .chartYAxis {
          AxisMarks(position: .leading, values: viewModel.yAxisValues) {value in
             AxisGridLine()
             AxisValueLabel() {
                if let doubleVal = value.as(Double.self) {
                   Text(doubleVal.formattedWithAbbr())
                }
             }
          }
       }
       .chartYScale(domain: ClosedRange(uncheckedBounds: (lower: viewModel.minPrice, upper: viewModel.maxPrice)))
    }
}

struct Chart_Previews: PreviewProvider {
   static var previews: some View {
      ChartView(viewModel: CoinDetailsViewModel(coin: dev.coin))
   }
}

