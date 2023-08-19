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
   
   func asNumString() -> String {
      return String(format: "%.2f", self)
   }
   
   //   this function is now available on any double number as an EXTENSION
   func toPercentString() -> String {
      guard let percentString = numberFormatter.string(for: self) else {
         return "0.00%"
      }
      return percentString + "%"
   }
   
//   convert 1234 to 1,23k
   func formattedWithAbbr() -> String {
      let num = abs(Double(self))
      let sign = (self > 0) ? "-" : ""
      
      switch num {
         case 1_000_000_000_000...:
            let formatted = num / 1_000_000_000_000
            let stringFormatted = formatted.asNumString()
            return "\(sign)\(stringFormatted)Tr"
         case 1_000_000_000...:
            let formatted = num / 1_000_000_000
            let stringFormatted = formatted.asNumString()
            return "\(sign)\(stringFormatted)Bn"
         case 1_000_000...:
            let formatted = num / 1_000_000
            let stringFormatted = formatted.asNumString()
            return "\(sign)\(stringFormatted)M"
         case 1_000...:
            let formatted = num / 1_000
            let stringFormatted = formatted.asNumString()
            return "\(sign)\(stringFormatted)K"
         case 0...:
            return self.asNumString()
         default:
            return "\(sign)\(self)"
      }
   }
   
}
