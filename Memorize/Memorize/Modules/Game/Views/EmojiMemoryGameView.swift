//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by sudhir on 18/11/25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
	
	typealias Card = MemoryGame<String>.Card
	
	@Namespace private var dealingNamespace
	
	@Bindable var emojiMemoryGame: EmojiMemoryGame
	
	@State private var lastScoreChange = (0, causedByID: "")
	@State private var  delt =  Set<Card.ID>()
	
	var body: some View {
		
		VStack {
			cards.foregroundStyle(emojiMemoryGame.color)
			bottomBar
		}
		.padding()
		
	}
	
	// MARK: - Custom view's
	private var cards: some View {
		AspectVGrid(
			items: emojiMemoryGame.cards,
			aspectRatio: Constant.aspectRatio
		) { card in
			if isDelt(card) {
				CardView(card)
					.matchedGeometryEffect(id: card.id, in: dealingNamespace)
					.transition(.asymmetric(insertion: .identity, removal: .identity))
					.padding(Constant.spacing)
					.overlay(FlayingNumber(number: scoreChange(causeBy: card)))
					.zIndex(cprint(scoreChange(causeBy: card) != 0 ? 100 : 0))
					.onTapGesture { _ in
						choose(card)
					}
			}
		}
	}
	
	private var bottomBar: some View {
		HStack {
			scoreView
			Spacer()
			deck.foregroundStyle(emojiMemoryGame.color)
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
	
	private var deck: some View {
		ZStack {
			ForEach(undealtCards) {
				CardView($0)
					.matchedGeometryEffect(id: $0.id, in: dealingNamespace)
					.transition(.asymmetric(insertion: .identity, removal: .identity))
			}
		}
		.frame(width: Constant.deckWidth, height: Constant.deckHeight)
		.onTapGesture {
			deal()
		}
	}
}

	// MARK: - HELPER'S
extension EmojiMemoryGameView {
	private var undealtCards: [Card] {
		emojiMemoryGame.cards.filter({ !isDelt($0) })
	}
	
	private func deal() {
		var delay: TimeInterval = 0
		for card in emojiMemoryGame.cards {
			withAnimation(Constant.dealAnimation.delay(delay)) {
				_ = delt.insert(card.id)
			}
			delay += Constant.dealInterval
		}
	}
	
	private func isDelt(_ card: Card) -> Bool {
		delt.contains(card.id)
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

	// MARK: - Constants
private extension EmojiMemoryGameView {
	enum Constant {
		static let aspectRatio: CGFloat = 2/3
		static let deckWidth: CGFloat = 50
		static let deckHeight: CGFloat = deckWidth / aspectRatio
		static let spacing: CGFloat = 4
		static let dealAnimation = Animation.easeInOut(duration: 1)
		static let dealInterval: TimeInterval = 0.15
	}
}

#Preview {
	@Previewable @State var viewModel: EmojiMemoryGame = .init()
	EmojiMemoryGameView(emojiMemoryGame: viewModel)
}


func cprint<T>(_ value: T) -> T {
	print(value, " Lo")
	return value
}
