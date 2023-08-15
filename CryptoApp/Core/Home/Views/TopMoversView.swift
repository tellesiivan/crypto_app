//
//  TopMoversView.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/13/23.
//

import SwiftUI

struct TopMoversView: View {
   @StateObject var viewModel: HomeViewModel

   var body: some View {
      
      VStack(alignment:.leading){
         Text("Today's Movers")
            .font(.headline)
            .padding()
         ScrollView(.horizontal, showsIndicators: false){
            HStack{
               ForEach(viewModel.topMovingCoins) {topMovingCoin in
                  NavigationLink {
                     CoinDetailsView()
                  } label: {
                     TopMoversItemView(topMovingCoin: topMovingCoin)
                        .padding(.leading, 6)
                  }
                  .foregroundStyle(.primaryText)
               }
            }
         }
      }
      .padding(.bottom)
   }
}
//
//#Preview {
//    TopMoversView()
//}
