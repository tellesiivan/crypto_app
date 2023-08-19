//
//  LoadingIndicatorView.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/19/23.
//

import SwiftUI

struct LoadingIndicatorView: View {
    var body: some View {
       RoundedRectangle(cornerSize: .zero)
          .frame(width: .infinity, height: .infinity)
          .opacity(0.2)
            .ignoresSafeArea()
            .overlay {
               ProgressView()
                  .progressViewStyle(.circular)
                  .accentColor(.white)
                  .scaleEffect(x: 2.5, y: 2.5, anchor: .center)
                  .frame(width: 80, height: 80)
            }
      }
   
      
}

#Preview {
    LoadingIndicatorView()
}
