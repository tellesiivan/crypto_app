//
//  CoinDetailsView.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/14/23.
//

import SwiftUI

struct CoinDetailsView: View {
   let viewModel: CoinDetailsViewModel
   
   init(coin: CoinModel) {
      self.viewModel = CoinDetailsViewModel(coin: coin)
   }
   
   var body: some View {
      ScrollView(showsIndicators: false){
         //             Chart
         
         ChartView(viewModel: viewModel)
            .frame(height: 250)
            .padding(.vertical)

         
         
         VStack(spacing:20) {
            //             Overview
            CoinDetailsSectionView(model: viewModel.overviewSectionModel)
            
            //             additional details
            CoinDetailsSectionView(model: viewModel.additionDetailsSectionModel)
         }
         .padding(.vertical)
         
      }
      .padding(.horizontal)
      .navigationTitle(viewModel.coinTitle)
   }
}


struct CoinDetailsViewPreview: PreviewProvider {
   static var previews: some View {
      CoinDetailsView(coin: dev.coin)
   }
}

