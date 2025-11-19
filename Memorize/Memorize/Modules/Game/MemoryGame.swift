//
//  MemorizeGame.swift
//  Memorize
//
//  Created by sudhir on 19/11/25.
//

import Foundation

struct MemoryGame<CardContent> {
	private(set) var cards: [Card]
	
	init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
		self.cards = []
		//add numbers of pairs cards x 2 cards
		
		for pairIndex in 0..<max(2, numberOfPairsOfCards) {
			let content = cardContentFactory(pairIndex)
			cards.append(Card(content: content))
			cards.append(Card(content: content))
		}
	}
	
	mutating func shuffle() {
		cards.shuffle()
	}
	
	func choose(_ card: Card) {
		
	}
	
	struct Card {
		var isFaceUp: Bool = true
		var isMatch: Bool = false
		let content: CardContent
	}
}
