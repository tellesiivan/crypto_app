//
//  CoinDetailsSectionView.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/14/23.
//

import SwiftUI

struct CoinDetailsSectionView: View {
   let model: CoinDetailsSectionModel
   
   private let columns: [GridItem] = [
      .init(.flexible()),
      .init(.flexible())
   ]
   
    var body: some View {
       VStack(spacing:12){
          Text(model.title)
             .font(.system(size: 20, weight: .semibold))
             .frame(maxWidth: .infinity, alignment: .leading)
          
          LazyVGrid(columns: columns, alignment: .leading, spacing:20) {
             ForEach(model.stats) { stat in
                StatisticView(stat: stat)
             }
          }
       }
    }
}


struct CoinDetailsSectionViewPreviews: PreviewProvider {
   static var previews: some View {
      CoinDetailsSectionView(model: dev.sectionModel)
   }
}
