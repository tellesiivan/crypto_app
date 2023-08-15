//
//  TopMoversItemView.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/13/23.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
   let topMovingCoin: CoinModel
   
    var body: some View {
     VStack(alignment:.leading){
        // image
        KFImage(URL(string: topMovingCoin.image))
         .resizable()
         .frame(width: 32, height: 32)
         .foregroundStyle(.orange)
         .padding(.bottom, 8)
        // coin name
      HStack(spacing:2){
         Text(topMovingCoin.symbol.uppercased())
          .font(.caption)
          .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
         Text(topMovingCoin.currentPrice.toCurrency())
          .font(.caption)
          .foregroundStyle(.gray)
        }
        // coin percent change
        Text(topMovingCoin.priceChangePercentage24H.toPercentString())
         .font(.title2)
         .foregroundStyle(topMovingCoin.marketCapChangePercentage24H ?? 0  > 0 ? .green : Color(.decreasePrice))
       }
     .frame(width: 140, height: 140)
     .background(Color(.itemBackground))
     .clipShape(.rect(cornerRadius: 8))
    
    }
}
