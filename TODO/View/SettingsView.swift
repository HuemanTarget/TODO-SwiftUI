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
      VStack(alignment: .center, spacing: 0) {
        Form {
          
          // SECTION 4
          Section(header: Text("About the application")) {
            ForRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
            
            ForRowStaticView(icon: "checkmark.seal", firstText: "Compatability", secondText: "iPhone, iPad")
            
            ForRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Joshua Basche")
            
            ForRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Joshua Basche")
            
            ForRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
          } //: SECTION 4
          .padding(.vertical, 3)
          
        } //: FORM
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        
        // FOOTER
        Text("Copyright ©2021 All Rights Reserved.\nBetter Apps ♡ Less Code")
          .multilineTextAlignment(.center)
          .font(.footnote)
          .padding(.top, 6)
          .padding(.bottom, 38)
          .foregroundColor(Color.secondary)
        
      } //: VSTACK
      .navigationBarTitle("Settings", displayMode: .inline)
      .background(Color("ColorBackground")).edgesIgnoringSafeArea(.all)
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
