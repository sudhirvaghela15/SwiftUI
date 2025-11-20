//
//  MemorizeGame.swift
//  Memorize
//
//  Created by sudhir on 19/11/25.
//

import Foundation

struct MemoryGame<CardContent: Hashable> {
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
	
	var indexOfTheOneAndOnlyFaceUpCard: Int? 
	
	mutating func choose(_ card: Card) {
		debugPrint("Choose",card)
		if let cardIndex = cards.firstIndex(where: { $0.id == card.id }) {
			if !cards[cardIndex].isFaceUp && !cards[cardIndex].isMatch {
				if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
					if cards[cardIndex].content == cards[potentialMatchIndex].content {
						cards[cardIndex].isMatch = true
						cards[potentialMatchIndex].isMatch = true
					}
					indexOfTheOneAndOnlyFaceUpCard = nil
				} else {
					for index in cards.indices {
						cards[index].isFaceUp = false
					}
					indexOfTheOneAndOnlyFaceUpCard = cardIndex
				}
				cards[cardIndex].isFaceUp = true
			}
		}
	}
	
	mutating func shuffle() {
		cards.shuffle()
	}
	
	struct Card: Equatable, Identifiable {
		let id = UUID()
		var isFaceUp: Bool = false
		var isMatch: Bool = false
		let content: CardContent
	}
}


