//
//  ContentView.swift
//  Memorize
//
//  Created by sudhir on 18/11/25.
//

import SwiftUI

struct ContentView: View {
	
	let emojis: [String] = [
		"☠️","😌","🏴‍☠️","🎃", "🦟", "🎥", "📡", "🦄",
	]
	
	@State private var count = 4
	
    var body: some View {
		VStack {

			HStack {
				ForEach(0..<count, id: \.self, content: {
					CardView(content: emojis[$0])
				})
			}
			.foregroundStyle(.orange)
			
			Spacer()
			
			HStack(alignment: .bottom) {
				Button(action: {
					if count > 0 {
						count -= 1
					}
				}) {
					Image(systemName: "rectangle.stack.badge.minus.fill")
				}
				
				Spacer()
				
				Button(action: {
					let emojiCount = emojis.count
	
					guard count < emojiCount else { return }
					count += 1
				}) {
					Image(systemName: "rectangle.stack.badge.plus.fill")
				}
			}.imageScale(.large)
			.font(.largeTitle)
		}
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
