//
//  ContentView.swift
//  Memorize
//
//  Created by sudhir on 18/11/25.
//

import SwiftUI

struct ContentView: View {
	
	let emojis = [
		"☠️",
		"😌",
		"🏴‍☠️",
		"🎃",
	]
	
    var body: some View {
		HStack {
			ForEach(emojis, id: \.self, content: {
				CardView(content: $0)
			})
		}
		.foregroundStyle(.orange)
		.padding()
		
    }
}

struct CardView: View {
	
	let content: String
	
	@State var isFaceUp: Bool = false
	
	var body: some View {
		ZStack {
			let roundRect = RoundedRectangle(cornerRadius: 12)
			
			if isFaceUp {
				roundRect.fill(.white)
				roundRect.strokeBorder(lineWidth: 2)
				Text(content)
					.font(.largeTitle)
					.fontWeight(.bold)
			} else {
				roundRect
			}
		}.onTapGesture {
			print("Tapped")
			isFaceUp.toggle()
		}
	}
}

#Preview {
    ContentView()
}
