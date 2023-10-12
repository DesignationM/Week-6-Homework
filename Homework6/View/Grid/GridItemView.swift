//
//  GridItemView.swift
//  Homework6
//
//  Created by KogaWolfe on 10/12/23.
//

import SwiftUI

struct GridItemView: View {
	var titleText: String
	var displayCount: Int
    var body: some View {
		VStack {
			Text(titleText)
				.padding(.bottom)
				.font(.title2)
			Text("\(displayCount)")
				.font(.title)
		}
		.frame(minWidth: 150, maxWidth: .infinity, minHeight: 150, maxHeight:.infinity)
		.background(Color.red)
		.bold()
		.foregroundColor(.white)
		.clipShape(RoundedRectangle(cornerRadius: 15.0))
    }
}

#Preview {
	Grid() {
		GridRow {
			GridItemView(titleText: Category.personal.rawValue, displayCount: 15)
			GridItemView(titleText: Category.work.rawValue, displayCount: 15)
		}
		GridRow {
			GridItemView(titleText: Category.home.rawValue, displayCount: 15)
			GridItemView(titleText: Category.noCategory.rawValue, displayCount: 15)
		}
	}
}
