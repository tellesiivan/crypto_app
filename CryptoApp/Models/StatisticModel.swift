//
//  StatisticsModel.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/16/23.
//

import Foundation

struct StatisticModel: Identifiable {
   let id = UUID().uuidString
   let title: String
   let subTitle: String
   let percentage: Double?
   
   init(title: String, subTitle: String, percentage: Double?) {
      self.title = title
      self.subTitle = subTitle
      self.percentage = percentage
   }
}
