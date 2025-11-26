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
	private var game: MemoryGame = createMemoryGame()
	
	var cards: [MemoryGame<String>.Card] {
		game.cards
	}
	
	var color: Color {
		.orange
	}
	
	var score: Int {
		game.score
	}
	
	// MARK: - Intents
	
	func shuffle() {
		game.shuffle()
	}
	func choose(_ card: MemoryGame<String>.Card) {
		game.choose(card)
	}
}
