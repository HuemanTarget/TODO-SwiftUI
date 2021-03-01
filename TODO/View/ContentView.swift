//
//  ContentView.swift
//  TODO
//
//  Created by Joshua Basche on 2/25/21.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  
  // Access Storage
  @Environment(\.managedObjectContext) var managedObjectContext
  
  @State private var showingAddTodoView: Bool = false
  
  // MARK: - BODY
  var body: some View {
    NavigationView {
      List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
        Text("Hello, world!")
      } //: LIST
      .navigationBarTitle("Todo", displayMode: .inline)
      .navigationBarItems(
        trailing:
          Button(action: {
            showingAddTodoView.toggle()
          }) {
            Image(systemName: "plus")
          } //: BUTTON
          .sheet(isPresented: $showingAddTodoView) {
            AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
          }
      )
    } //: NAVIGATION
  }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
