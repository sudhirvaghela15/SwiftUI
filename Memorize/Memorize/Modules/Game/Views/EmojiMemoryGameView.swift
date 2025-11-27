//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by sudhir on 18/11/25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
	typealias Card = MemoryGame<String>.Card
//	@State var viewModel: EmojiMemoryGame = .init()
	@Bindable var emojiMemoryGame: EmojiMemoryGame
	@State private var lastScoreChange = (0, causedByID: "")
	private let aspectRatio: CGFloat = 2/3
	private let spacing: CGFloat = 4
	
    var body: some View {
	
		VStack {
			cards
				.foregroundStyle(emojiMemoryGame.color)
			bottomBar
		}
		.padding()
		
    }
	
	private  var bottomBar: some View {
		HStack {
			scoreView
			Spacer()
			shuffleView
		}.font(.largeTitle)
	}
	private var scoreView: some View {
		Text("Score: \(emojiMemoryGame.score)")
			.animation(nil)
	}
	
	private var shuffleView: some View {
		Button(action: {
			withAnimation {
				emojiMemoryGame.shuffle()
			}
		}, label: {
			Text("Shuffle")
		})
	}
	
	private var cards: some View {
		AspectVGrid(
			items: emojiMemoryGame.cards,
			aspectRatio: aspectRatio,
			content: { card in
				CardView(card)
					.padding(spacing)
					.overlay(
						FlayingNumber(number: scoreChange(causeBy: card))
					)
					.zIndex(scoreChange(causeBy: card) != 0 ? 100 : 0)
					.onTapGesture { _ in
						choose(card)
					}
			})
	}
	
	private func choose(_ card: Card) {
		withAnimation {
			let scoreBeforeChoosing = emojiMemoryGame.score
			emojiMemoryGame.choose(card)
			let scoreChange = emojiMemoryGame.score - scoreBeforeChoosing
			self.lastScoreChange = (scoreChange, causedByID: card.id)
		}
	}
	private func scoreChange(causeBy card: Card) -> Int {
		let (amount, id) = lastScoreChange
		return card.id == id ? amount : 0
	}
}

#Preview {
	@Previewable @State var viewModel: EmojiMemoryGame = .init()
	EmojiMemoryGameView(emojiMemoryGame: viewModel)
}
