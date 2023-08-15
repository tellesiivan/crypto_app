//
//  CoinDetailsView.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/14/23.
//

import SwiftUI

struct CoinDetailsView: View {
   var body: some View {
      NavigationStack{
         ScrollView{
            //             Chart
            VStack(spacing:20) {
               //             Overview
               CoinDetailsSectionView()
               
               //             additional details
               CoinDetailsSectionView()
            }
            
         }
         .padding()
         .navigationTitle("Bitcoin")
      }
   }
}

//#Preview {
//    CoinDetailsView()
//}
