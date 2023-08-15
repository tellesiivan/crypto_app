//
//  CoinDetailsSectionView.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/14/23.
//

import SwiftUI

struct CoinDetailsSectionView: View {
   private let columns: [GridItem] = [
      .init(.flexible()),
      .init(.flexible())
   ]
   
    var body: some View {
       VStack{
          Text("Overview")
             .font(.headline).bold()
             .frame(maxWidth: .infinity, alignment: .leading)
          
          LazyVGrid(columns: columns, alignment: .leading, spacing:20) {
             ForEach(0..<4, id:\.self) { _ in
                StatisticView()
             }
          }
       }
    }
}

#Preview {
    CoinDetailsSectionView()
}
