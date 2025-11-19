//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by sudhir on 18/11/25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
	
//	@State var viewModel: EmojiMemoryGame = .init()
	var viewModel: EmojiMemoryGame
	
    var body: some View {
		VStack {
			ScrollView(.vertical) {
				cards
			}.overlay(alignment: .bottomTrailing, content: {
				Button(action: viewModel.shuffle, label: {
				 Text("Shuffle")
			 })
		 })
		}
		.padding()
		
    }
	
	var cards: some View {
		LazyVGrid(
			columns: [GridItem(.adaptive(minimum: 85), spacing: 0)],
			spacing: 0
		) {
			ForEach(viewModel.cards.indices, id: \.self, content: {
			   CardView(viewModel.cards[$0])
				   .aspectRatio(2/3, contentMode: .fit)
				   .padding(4)
		   })
		}
		.foregroundStyle(.orange)
	}
}

struct CardView: View {
	
	private let card: MemoryGame<String>.Card
	
	init(_ card: MemoryGame<String>.Card) {
		self.card = card
	}
	
	var body: some View {
		ZStack {
			let roundRect = RoundedRectangle(cornerRadius: 12)
			
			Group {
				roundRect.fill(.white)
				roundRect.strokeBorder(lineWidth: 2)
				Text(card.content)
					.font(.system(size: 200))
					.minimumScaleFactor(0.01)
					.fontWeight(.bold)
					.aspectRatio(1, contentMode: .fit)
			}.opacity(card.isFaceUp ? 1 : 0)
			
			roundRect.opacity(card.isFaceUp ? 0 : 1)
		}
	}
}

#Preview {
	@Previewable @State var viewModel: EmojiMemoryGame = .init()
	EmojiMemoryGameView(viewModel: viewModel)
}
