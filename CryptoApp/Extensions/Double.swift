//
//  Double.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/13/23.
//

import Foundation

extension Double {
   private var currencyFormatter: NumberFormatter {
      let formatter = NumberFormatter()
      formatter.usesGroupingSeparator = true
      formatter.numberStyle = .currency
      formatter.minimumFractionDigits = 2
      formatter.maximumFractionDigits = 2
      return formatter
   }
   private var numberFormatter: NumberFormatter {
      let formatter = NumberFormatter()
      formatter.numberStyle = .decimal
      formatter.minimumFractionDigits = 2
      formatter.maximumFractionDigits = 2
      return formatter
   }
   
//   this function is now available on any double number as an EXTENSION
   func toCurrency() -> String {
      return currencyFormatter.string(for: self) ?? "$0.00"
   }
   
   //   this function is now available on any double number as an EXTENSION
   func toPercentString() -> String {
      guard let percentString = numberFormatter.string(for: self) else {
         return "0.00%"
      }
      return percentString + "%"
   }
   
}
