//
//  SettingsView.swift
//  TODO
//
//  Created by Joshua Basche on 3/5/21.
//

import SwiftUI

struct SettingsView: View {
  // MARK: - PROPERTIES
  @Environment(\.presentationMode) var presentationMode
  
  
  // MARK: - BODY
  var body: some View {
    NavigationView {
      VStack {
        Group {
          HStack {
            Image(systemName: "paintbrush")
            
            Spacer()
            
            Image(systemName: "paintbrush")
          }
          .padding(.horizontal, 20)
        }
        .padding(.top, 30)
        
        Spacer()
        
      } //: VSTACK
      .navigationBarTitle("Settings", displayMode: .inline)
      .navigationBarItems(
        trailing:
          Button(action: {
            presentationMode.wrappedValue.dismiss()
          }) {
            Image(systemName: "xmark")
          }
      )
    } //: NAVIGATION
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}
