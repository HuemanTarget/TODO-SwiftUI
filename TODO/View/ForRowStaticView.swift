//
//  ForRowStaticView.swift
//  TODO
//
//  Created by Joshua Basche on 3/9/21.
//

import SwiftUI

struct ForRowStaticView: View {
  // MARK: - PROPERTIES
  var icon: String
  var firstText: String
  var secondText: String
  
  // MARK: - BODY
  var body: some View {
    HStack {
      ZStack {
        RoundedRectangle(cornerRadius: 8, style: .continuous)
          .fill(Color.gray)
        Image(systemName: icon)
          .foregroundColor(Color.white)
      }
      .frame(width: 36, height: 36, alignment: .center)
      
      Text(firstText).foregroundColor(.gray)
      
      Spacer()
      
      Text(secondText)
    }
  }
}

// MARK: - PREVIEW
struct ForRowStaticView_Previews: PreviewProvider {
  static var previews: some View {
    ForRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
      .previewLayout(.fixed(width: 375, height: 60))
      .padding()
  }
}
