//
//  ChartDataModel.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/17/23.
//

import Foundation

struct ChartDataModel: Identifiable {
   let id = UUID().uuidString
   let date: Date
   let value: Double
   
   
}
