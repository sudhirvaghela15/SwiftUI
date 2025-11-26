//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by sudhir on 19/11/25.
//

import SwiftUI


@Observable
class EmojiMemoryGame {
	private static let emojis = ["☠️","😌","🏴‍☠️","🎃", "🦟", "🎥", "📡", " 🦄",]
	private static func createMemoryGame() -> MemoryGame<String> {
		.init(
			numberOfPairsOfCards: 8,
			cardContentFactory: { pairIndex in
				if emojis.indices.contains(pairIndex) {
					return emojis[pairIndex]
				} else {
					return "❓"
				}
			}
		)
	}
	
//	@ObservationIgnored
	private var model: MemoryGame = createMemoryGame()
	
	var cards: [MemoryGame<String>.Card] {
		model.cards
	}
	
	var color: Color {
		.orange
	}
	
	// MARK: - Intents
	
	func shuffle() {
		model.shuffle()
	}
	func choose(_ card: MemoryGame<String>.Card) {
		model.choose(card)
	}
}
