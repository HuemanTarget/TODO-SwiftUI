//
//  ContentView.swift
//  TODO
//
//  Created by Joshua Basche on 2/25/21.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  @State private var buttonOpacityAnimating: Bool = false
  
  // Access Storage
  @Environment(\.managedObjectContext) var managedObjectContext
  
  @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
  
  @State private var showingAddTodoView: Bool = false
  @State private var showingSettingsView: Bool = false
  
  // MARK: - BODY
  var body: some View {
    NavigationView {
      ZStack {
        List {
          ForEach(self.todos, id: \.self) { todo in
            HStack {
              Text(todo.name ?? "Unknown")
              
              Spacer()
              
              Text(todo.priority ?? "Unknown")
            }
          } //: FOREACH
          .onDelete(perform: deleteTodo)
        } //: LIST
        .navigationBarTitle("Todo", displayMode: .inline)
        .navigationBarItems(
          leading: EditButton(),
          trailing:
            Button(action: {
              self.showingSettingsView.toggle()
            }) {
              Image(systemName: "paintbrush")
                .imageScale(.large)
            } //: BUTTON
            .sheet(isPresented: $showingSettingsView) {
              SettingsView().environment(\.managedObjectContext, self.managedObjectContext)
            }
        ) //: NAVBARITEMS
        
        // NO TODO ITEMS
        if todos.count == 0 {
          EmptyListView()
        }
        
      } //: ZSTACK
      .sheet(isPresented: $showingAddTodoView) {
        AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
      }
      .overlay(
        ZStack {
          Group {
            Circle()
              .fill(Color.blue)
              .opacity(buttonOpacityAnimating ? 0.2 : 0)
              .frame(width: 68, height: 68, alignment: .center)
            Circle()
              .fill(Color.blue)
              .opacity(buttonOpacityAnimating ? 0.15 : 0)
              .frame(width: 88, height: 88, alignment: .center)
          }
          //.animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
          
          Button(action: {
            self.showingAddTodoView.toggle()
          }) {
            Image(systemName: "plus.circle.fill")
              .resizable()
              .scaledToFit()
              .background(Circle().fill(Color("ColorBase")))
              .frame(width: 48, height: 48, alignment: .center)
          } //: BUTTON
          .onAppear(perform: {
            self.buttonOpacityAnimating.toggle()
          })
          
        } //: ZSTACK
        .padding(.bottom, 15)
        .padding(.trailing, 15)
        , alignment: .bottomTrailing
      )
    } //: NAVIGATION
  }
  
  // MARK: - FUNCTIONS
  
  private func deleteTodo(at offsets: IndexSet) {
    for index in offsets {
      let todo = todos[index]
      managedObjectContext.delete(todo)
      
      do {
        try managedObjectContext.save()
      } catch {
        print(error)
      }
    }
  }
  
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    return ContentView()
      .environment(\.managedObjectContext, context)
  }
}
