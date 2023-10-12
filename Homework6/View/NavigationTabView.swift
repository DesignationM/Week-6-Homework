//
//  NavigationTabView.swift
//  Homework6
//
//  Created by KogaWolfe on 10/11/23.
//

import SwiftUI

struct NavigationTabView: View {
/// R3 Add a TabView to the project, with two tabs. 
/// The first tab should display the list of incomplete tasks using the SF Symbol list.bullet.circle as the image and “Tasks” as the text.
/// The second tab should showcase completed tasks with the SF Symbol checkmark.circle as the image and “Completed” as the text.
/// Ensure that the TabView is presented when the user launches the app. Note the add new task button should not appear on the Completed tasks tab.

	@ObservedObject var taskStore: TaskStore

	var title: String
	var showCompleted: Bool
	var showAddTaskButton: Bool
	var body: some View {
		NavigationStack {
			VStack {
				TaskListView(taskStore: taskStore, isCompleted: showCompleted)
///R4 add the ability for the user to search tasks both completed and uncompleted.
///I bound the searchText to a searchable in the TaskStore, so the store is handling the list not this view.
					.searchable(
						text: $taskStore.searchText,
						placement: .navigationBarDrawer(displayMode: .always))
/// This toolbar modifier is determining when to display the add Item based on the boolean being injected into the view on creation.
					.toolbar {
						if showAddTaskButton {
							ToolbarItem(placement: .navigationBarTrailing) {
								NewTaskButtonView(taskStore: taskStore)
							}
						}
					}
					.navigationTitle(title)
					
			}
		}
	}
}

#Preview {
	NavigationTabView(taskStore: TaskStore(), title: "Preview", showCompleted: true, showAddTaskButton: true)
}
