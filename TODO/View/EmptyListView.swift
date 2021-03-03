//
//  EmptyListView.swift
//  TODO
//
//  Created by Joshua Basche on 3/3/21.
//

import SwiftUI

struct EmptyListView: View {
  // MARK: - PROPERTIES
  
  // MARK: - BODY
  var body: some View {
    ZStack {
      VStack(alignment: .center, spacing: 20) {
        Image("illustration-no1")
          .resizable()
          .scaledToFit()
          .frame(minWidth: 265, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
          .layoutPriority(1)
        Text("Use your time wisely.")
          .layoutPriority(0.5)
          .font(.system(.headline, design: .rounded))
      } //: VSTACK
      .padding(.horizontal)
    } //: ZSTACK
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(Color("ColorBase"))
    .edgesIgnoringSafeArea(.all)
  }
}

// MARK: - PREVIEW
struct EmptyListView_Previews: PreviewProvider {
  static var previews: some View {
    EmptyListView()
      .environment(\.colorScheme, .dark)
  }
}
