//
//  LazyNavigationView.swift
//  CryptoApp
//
//  Created by Telles Ivan on 8/19/23.
//

import SwiftUI

struct LazyNavigationView<Content: View> : View {
   let build: () -> Content
   
   init(build: @autoclosure @escaping () -> Content) {
      self.build = build
   }
   
   var body: Content {
      build()
   }
   
}
