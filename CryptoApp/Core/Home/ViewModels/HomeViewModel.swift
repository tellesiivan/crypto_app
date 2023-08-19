//
//  HomeViewMode.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/13/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
   @Published var coins = [CoinModel]()
   @Published var topMovingCoins = [CoinModel]()
   @Published var isLoadingData = true
   
   init(){
      fetchCoinData()
   }
   
   func fetchCoinData() {
      let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"
      
      guard let url = URL(string: urlString) else {return}
      URLSession.shared.dataTask(with: url) { data, response, error in
         if let error = error {
            print("DEBUG: Error --> \(error.localizedDescription)")
            self.isLoadingData = false
            return
         }
         
         //         maybe handle an error here
         //         if let response = response as? HTTPURLResponse {
         //            print("DEBUG: Response Code \(response.statusCode)")
         //         }
         
         guard let data = data else {return}
         
         do {
            let coins = try? JSONDecoder().decode([CoinModel].self, from: data)
            guard let coins = coins else{
               print("DEBUG: Error --> Failed to decode coins"); return;
            }
            DispatchQueue.main.async {
               self.coins = coins
               self.configureTopMovingCoins()
               self.isLoadingData = false
            }
         } catch _ {
            print("DEBUG: Error --> Failed to decode coins")
            self.isLoadingData = false
            
         }
         
      }.resume()
   }
   
   func configureTopMovingCoins() {
      // sort by the coin that percentage changed the most in the last 24hrs
      let sortedTopMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H })
      DispatchQueue.main.async {
         self.topMovingCoins = Array(sortedTopMovers.prefix(5))
      }
   }
   
}
