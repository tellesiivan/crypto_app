//
//  HomeView.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/9/23.
//

import SwiftUI

struct HomeView: View {
   @StateObject var viewModel = HomeViewModel()
   
   
    var body: some View {
       NavigationStack {
          ScrollView(.vertical, showsIndicators:false) {
//             top movers view
             TopMoversView(viewModel: viewModel)
             
             Divider()
//             aLL coins view
             AllCoinsView(viewModel: viewModel)
          }
          .navigationTitle("Live Prices")
          .navigationBarTitleDisplayMode(.automatic)
          
       }
    }
}

#Preview {
    HomeView()
}
