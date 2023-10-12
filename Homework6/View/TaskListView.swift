//
//  TaskListView.swift
//  

import SwiftUI

struct TaskListView: View {
  @ObservedObject var taskStore: TaskStore

  var isCompleted: Bool = false
  var body: some View {
    VStack {
/// R1 - Refactor TaskListView to replace the current implementation with a List. Ensure the existing layout  is preserved using appropriate modifiers.
///
//      ScrollView {
//        ForEach(taskStore.tasks, id: \.self) { task in
//          NavigationLink(value: task) {
//            VStack {
//              TaskRowView(task: task)
//              Divider()
//            }
//            .padding([.leading, .trailing], 20)
//          }
//        }

/// R1 first draft
/// 	List(taskStore) { task in
		  List(taskStore.getCompleted(isCompleted)) { task in
			  NavigationLink(value: task) {
				  VStack {
					  TaskRowView(task: $taskStore.tasks
						.first(where: {$0.id == task.id})!)
/// R5 - We're binding the taask that sent to the RowView so it's value can be toggled. This idea is the same as what was sent to the DetailView a few lines down.
				  }
			  }
		  }
		 
// R1 - Ensure the existing layour is preserved using appropriate modifiers
		  .listStyle(.plain)

		.navigationDestination(for: Task.self) { task in
          TaskDetailView(task: $taskStore.tasks
            .first(where: { $0.id == task.id })!)
        }
      }
    }
 //}
}

struct TaskListView_Previews: PreviewProvider {
  static var previews: some View {
    TaskListView(taskStore: TaskStore())
  }
}
