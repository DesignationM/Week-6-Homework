//
//  GridAndListView.swift
//  Homework6
//
//  Created by KogaWolfe on 10/12/23.
//

import SwiftUI

struct GridAndListView: View {
	@ObservedObject var taskStore: TaskStore
	@State var selectedCategory: Category? = nil
	
	var twoColumnGrid: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
	var body: some View {
		NavigationStack {
				VStack {
					// A&B R6 - The screen must include a Grid and a List
					LazyVGrid(columns: twoColumnGrid) {
						ForEach(Category.allCases, id:\.self) { category in
							GridItemView(titleText: category.rawValue, displayCount: taskStore.tasks.filter{ $0.category == category}.count)
								.onTapGesture {
									if selectedCategory == category {
										selectedCategory = nil
									} else {
										selectedCategory = category
									}
								}
						}
					}
					.padding()
					List(selectedCategory == nil ? taskStore.tasks : taskStore.tasks.filter{$0.category == selectedCategory}) { task in
						NavigationLink(value: task) {
							VStack {
								TaskRowView(task: $taskStore.tasks
								  .first(where: {$0.id == task.id})!)
							}
						}
					}
					.listStyle(.plain)
				  .navigationDestination(for: Task.self) { task in
					TaskDetailView(task: $taskStore.tasks
					  .first(where: { $0.id == task.id })!)
				  }
				}
			}
		}
	}


#Preview {
    GridAndListView(taskStore: TaskStore())
}
