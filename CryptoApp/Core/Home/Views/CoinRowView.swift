//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/13/23.
//

import SwiftUI
import Kingfisher


struct CoinRowView: View {
   let coin: CoinModel
   
   var body: some View {
      HStack{
         //          market cap rank
         Text("\(coin.marketCapRank ?? 1)")
            .font(.caption)
            .foregroundStyle(.gray)
         //          image
         KFImage(URL(string: coin.image))
            .resizable()
            .scaledToFit()
            .frame(width: 32, height: 32)
            .foregroundStyle(.orange)
         //          coin name info'
         VStack(alignment: .leading, spacing:4){
            Text(coin.name)
               .font(.subheadline)
               .fontWeight(.semibold)
               .padding(.leading, 4)
            Text(coin.symbol.uppercased())
               .font(.subheadline)
               .padding(.leading, 6)
               .foregroundStyle(.gray)
            
         }
         .padding(.leading,2)
         Spacer()
         VStack(alignment: .trailing, spacing:4){
            Text(coin.currentPrice.toCurrency())
               .font(.subheadline)
               .fontWeight(.semibold)
               .padding(.leading, 4)
            Text(coin.priceChangePercentage24H.toPercentString())
               .font(.subheadline)
               .padding(.leading, 6)
               .foregroundStyle(coin.priceChangePercentage24H > 0 ? .green : .red)
            
         }
         .padding(.trailing,2)
        
         //          coin price info
      }
      .padding(.horizontal)
      .padding(.vertical, 4)
   }
}

