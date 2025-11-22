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
	private let aspectRatio: CGFloat = 2/3
	
    var body: some View {
	
		VStack {
			cards
				.animation(.default, value: viewModel.cards)
			Button(action: viewModel.shuffle, label: {
				Text("Shuffle")
			})
		}
		.padding()
		
    }
	
	@ViewBuilder
	private var cards: some View {
		AspectVGrid(
			items: viewModel.cards,
			aspectRatio: aspectRatio,
			content: { card in
				CardView(card)
					.padding(4)
					.onTapGesture { _ in viewModel.choose(card) }
			})
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
		}.opacity(card.isFaceUp || !card.isMatch ? 1 : 0)
	}
}

#Preview {
	@Previewable @State var viewModel: EmojiMemoryGame = .init()
	EmojiMemoryGameView(viewModel: viewModel)
}
