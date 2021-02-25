//
//  AddTodoView.swift
//  TODO
//
//  Created by Joshua Basche on 2/25/21.
//

import SwiftUI

struct AddTodoView: View {
  // MARK: - PROPERTIES
  @State private var name: String = ""
  @State private var priority: String = "Normal"
  
  let priorities = ["High", "Normal", "Low"]
  
  // MARK: - BODY
  var body: some View {
    NavigationView {
      VStack {
        Form {
          // TODO NAME
          TextField("Todo", text: $name)
          
          // TODO PRIORITY
          Picker("Priority", selection: $priority) {
            ForEach(priorities, id: \.self) {
              Text($0)
            }
          }
          .pickerStyle(SegmentedPickerStyle())
          
          // SAVE BUTTON
          Button(action: {
            print("Save a todo item.")
          }) {
            Text("Save")
          } //: BUTTON
        } //: FORM
        Spacer()
      } //: VSTACK
      .navigationBarTitle("New Todo", displayMode: .inline)
    } //: NAVIGATION
  }
}

// MARK: - PREVIEW
struct AddTodoView_Previews: PreviewProvider {
  static var previews: some View {
    AddTodoView()
  }
}
