//
//  CoinRowView.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/13/23.
//

import SwiftUI

struct AllCoinsView: View {
   @StateObject var viewModel: HomeViewModel
   
    var body: some View {
       VStack( spacing: 8) {
          VStack(alignment:.leading, spacing: 16) {
             Text("All Coins")
                .font(.headline)
             HStack{
                Text("Coin")
                Spacer()
                Text("Prices")
             }
             .font(.caption)
             .foregroundStyle(.gray)
          }
          .padding(.horizontal)
          
          ScrollView {
             VStack{
                ForEach(viewModel.coins) {coin in
                   CoinRowView(coin: coin)
                }
             }
          }
       }
       .padding(.vertical)
       
    }
}

//#Preview {
//   AllCoinsView()
//}
