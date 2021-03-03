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
  
  @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
  
  @State private var showingAddTodoView: Bool = false
  
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
              self.showingAddTodoView.toggle()
            }) {
              Image(systemName: "plus")
            } //: BUTTON
            .sheet(isPresented: $showingAddTodoView) {
              AddTodoView().environment(\.managedObjectContext, self.managedObjectContext)
            }
        ) //: NAVBARITEMS
        
        // NO TODO ITEMS
        if todos.count == 0 {
          EmptyListView()
        }
        
      } //: ZSTACK
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
