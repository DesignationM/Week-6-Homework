//
//  TaskRow.swift
//  

import SwiftUI

struct TaskRowView: View {
/// R5, First we changed the task sent to this view to a binding.
/// This lets us change the isCompleted property with onTapGesture.
/// We also added a showAnimation value that will control the animation timing which look to display
  @State private var showAnimation = false
  @Binding var task: Task

  var body: some View {
    HStack {
      Text(task.title)
      Spacer()
		Image(systemName: showAnimation ? "checkmark.square" : "square")
			.foregroundColor(showAnimation ? Color.green : Color.red)
/// R5 onTap adds the listener for the tap
		.onTapGesture {
			/// R5 withAnimation controls the animation
			withAnimation(.easeInOut(duration: 0.4)) {
				/// Here we tell the control boolean to switch, which causes the rerender
				self.showAnimation.toggle()
				DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
					/// This delays the actual value being changed so the animation can complete. 
					task.isCompleted.toggle()
				}
			}
		}

    }
    .font(.title3)
    .bold()
    .padding([.top, .bottom], 15)
    .padding([.leading, .trailing], 10)
	.onAppear() {
		showAnimation = task.isCompleted
	}
  }
}

struct TaskRow_Previews: PreviewProvider {
  static var previews: some View {
	  //TaskRowView(task: Task(title: "My Task", category: .noCategory, isCompleted: false))
	  TaskRowView(task: .constant(Task(title: "My Task", category: .noCategory, isCompleted: false)))
  }
}
