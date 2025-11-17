//
//  ContentView.swift
//  Memorize
//
//  Created by sudhir on 18/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 20)
				.stroke(lineWidth: 2)
				.overlay {
					Text("☠️")
						.font(.largeTitle)
						.fontWeight(.bold)
				}
		}
		.padding(.horizontal)
		.foregroundStyle(.red)
    }
}

#Preview {
    ContentView()
}
