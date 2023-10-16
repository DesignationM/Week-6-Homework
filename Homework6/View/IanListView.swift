//
//  IanListView.swift
//  Homework6
//
//  Created by KogaWolfe on 10/12/23.
//

import SwiftUI

struct IanListView: View {
	@ObservedObject var taskStore: TaskStore
	
	var isCompleted: Bool = false
	var body: some View {
		
		VStack {
			List(taskStore.testTasks){ task in
				TaskRowView(task: $taskStore.testTasks
					.first(where: {$0.id == task.id})!)
				.swipeActions {
					Button(role: .destructive) {
						taskStore.removeTestTask(task: task)
					} label: {
						Text("Delete")
					}
				}
			}.listStyle(.plain)
			
			ScrollView {
				LazyVStack {
					ForEach(taskStore.testTasks2, id:\.self) { task in
						VStack {
// This is a button over the entire view. Clicking it removes the item from the list.
//							Button( action: {
//								withAnimation { () -> () in
//									taskStore.removeTestTask2(task: task)
//								}
//							}) {
//								TaskRowView(task: $taskStore.testTasks2
//									.first(where: {$0.id == task.id})!)
//	
//								Divider()
//							}
//							.transition(.slide)
//							.padding([.leading, .trailing], 20)
						
// Using group to set the properties on the item. The animation is running as a task when the value changes.
							Group {
								TaskRowView(task: $taskStore.testTasks2
									.first(where: {$0.id == task.id})!)
								Divider()
							}
							.transition(.scale)
							.padding([.leading, .trailing], 20)
							.task {
								withAnimation { () -> () in
									if !task.shouldDisplay {
										taskStore.removeTestTask2(task: task)
									}
								}
							}
						}
					}
				}
			}
		}
	}
}

#Preview {
	IanListView(taskStore: TaskStore(), isCompleted: false)
}
