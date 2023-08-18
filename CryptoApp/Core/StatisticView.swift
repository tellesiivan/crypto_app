//
//  StatisticView.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/14/23.
//

import SwiftUI

struct StatisticView: View {
   let stat: StatisticModel
   
    var body: some View {
       VStack(alignment: .leading, spacing:4){
          Text(stat.title)
             .font(.caption)
          Text(stat.subTitle)
             .font(.headline)
          if let percentage = stat.percentage {
             HStack(spacing:4) {
                Image(systemName: "triangle.fill")
                   .font(.caption)
                Text(percentage.toPercentString())
                   .font(.caption)
                   .bold()
             }
             .foregroundStyle(.green)
          }
          }
       }
    }


struct Statistic_Previews: PreviewProvider {
   static var previews: some View {
      StatisticView(stat: dev.stat2)
   }
}
