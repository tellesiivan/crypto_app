//
//  CoinDetailsViewModel.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/16/23.
//

import Foundation

class CoinDetailsViewModel {
   private let coin: CoinModel
   
//   chart config
   var chartData = [ChartDataModel]()
   var startDate = Date()
   var endDate = Date()
   var minPrice = 0.0
   var maxPrice = 0.0
   
   
   var overviewSectionModel: CoinDetailsSectionModel {
      //      price stats
      let priceStat: StatisticModel = StatisticModel(title: "Current Price", subTitle: self.coin.currentPrice.toCurrency(), percentage: self.coin.priceChangePercentage24H)
      //      market cap stats
      let marketCapStat:StatisticModel = StatisticModel(title: "Market Cap", subTitle: String(self.coin.marketCap ?? 0), percentage: self.coin.marketCapChangePercentage24H)
      //      rank stats
      let rankStat:StatisticModel = StatisticModel(title: "Rank", subTitle: String(self.coin.marketCapRank), percentage: nil)
      //      volume stats
      let volumeStat:StatisticModel = StatisticModel(title: "Volume", subTitle: String(self.coin.totalVolume ?? 0), percentage: nil)
      
      return CoinDetailsSectionModel(title: "OverView", stats: [priceStat,marketCapStat,rankStat, volumeStat])
   }
   
   var additionDetailsSectionModel: CoinDetailsSectionModel {
      //      24h High
      let high24Hstat:StatisticModel = StatisticModel(title: "24h High", subTitle: self.coin.high24H?.toCurrency() ?? "", percentage: nil)
      //      24h Low
      let low24Hstat:StatisticModel = StatisticModel(title: "24h Low", subTitle: self.coin.low24H?.toCurrency() ?? "", percentage: nil)
      //      24h price change
      let price24Hchange:StatisticModel = StatisticModel(title: "24h Price Change", subTitle: self.coin.priceChange24H.toCurrency(), percentage: self.coin.priceChangePercentage24H)
      //      24h market cap change stat
      let marketCap24Hchange:StatisticModel = StatisticModel(title: "24h Market Cap Change", subTitle: self.coin.marketCapChange24H?.toCurrency() ?? "", percentage: self.coin.marketCapChangePercentage24H)
      
      return CoinDetailsSectionModel(title: "Additional Details", stats: [high24Hstat, low24Hstat, price24Hchange, marketCap24Hchange])
   }
   
   init(coin: CoinModel) {
      self.coin = coin
      self.configureChartData()
   }
   
   func configureChartData() {
      guard let priceData = coin.sparklineIn7D?.price else {return}
      self.endDate = Date(coinGeckoString: coin.lastUpdated ?? "")
      self.startDate = endDate.addingTimeInterval(-7 * 60 * 60 * 24)
      self.maxPrice = priceData.max()!
      self.minPrice = priceData.min()!
      
      var index = 0

      for price in priceData.reversed() {
         let date = endDate.addingTimeInterval(-1 * 60 * 60 * Double(index))
         let chartData = ChartDataModel(date: date, value: price)
         index += 1
      }
   }
   
}
