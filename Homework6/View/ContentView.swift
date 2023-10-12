//
//  ContentView.swift
//

import SwiftUI

struct ContentView: View {
  @StateObject var taskStore = TaskStore()
  @AppStorage("CurrentTab") var selectedTab = 0
  var body: some View {

/// R3 - At this point each tab will have their own navigation stack so we'll move that into the view that displays the tab's content.
/// See NavigationTabView 
      VStack {
		  TabView(selection: $selectedTab) {
			  NavigationTabView(
				taskStore: taskStore,
				title: "My Tasks",
				showCompleted: false,
				showAddTaskButton: true
			  )
			  .tabItem {
				  Label("Task", systemImage: "list.bullet.circle")
					  
			  }
			  .tag(0)
			  /// Just an example for badges and math
			  .badge(taskStore.getCount(false))
			  
// R3 - second tab example
			  NavigationTabView(
				taskStore: taskStore,
				title: "My Completed Tasks",
				showCompleted: true,
				showAddTaskButton: false
			  )
			  .tabItem {
				  Label("Task", systemImage: "checkmark.circle")
					  
			  }
			  .tag(1)
			  /// Just an example for badges and math
			  .badge(taskStore.getCount(true))
			  
			  /// Part 3 A&B
			  GridAndListView(taskStore: taskStore)
				  .tabItem {
					  Label("Grid", systemImage: "square.grid.2x2")
				  }
				  .tag(2)
			  /// Note not having a tag and create a bug where changes on the child will swap tabs
		  }
		}
      }
 
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
