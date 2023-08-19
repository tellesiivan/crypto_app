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
          ZStack {
             ScrollView(.vertical, showsIndicators:false) {
   //             top movers view
                TopMoversView(viewModel: viewModel)
                
                Divider()
   //             aLL coins view
                AllCoinsView(viewModel: viewModel)
             }
             if viewModel.isLoadingData {
                LoadingIndicatorView()
             }
          }
          .navigationTitle("Live Prices")
       }
       
       
    }
}

#Preview {
    HomeView()
}
