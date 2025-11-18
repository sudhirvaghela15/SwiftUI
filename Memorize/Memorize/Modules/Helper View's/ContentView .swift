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

			cards
			
			Spacer()
			
			cardCountAdjusters
			
		}
		.padding()
		
    }
	
	var cards: some View {
		HStack {
		   ForEach(0..<count, id: \.self, content: {
			   CardView(content: emojis[$0])
		   })
		}
		.foregroundStyle(.orange)
	}
	
	var cardCountAdjusters: some View {
		HStack(alignment: .bottom) {
			cardRemover
			
			Spacer()
			
			cardAdder
		}.imageScale(.large)
		.font(.largeTitle)
	}
	
	func cardCountAdujuster(by offset: Int, symbol: String) -> some View {
		Button(action: {
			count += offset
		}) {
			Image(systemName: symbol)
		}.disabled(count + offset < 1 || count + offset > emojis.count)
	}

	var cardRemover: some View {
		cardCountAdujuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
	}
	
	var cardAdder: some View {
		cardCountAdujuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
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
