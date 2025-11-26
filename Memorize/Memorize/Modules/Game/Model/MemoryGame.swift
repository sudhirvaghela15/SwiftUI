//
//  MemorizeGame.swift
//  Memorize
//
//  Created by sudhir on 19/11/25.
//

import Foundation

struct MemoryGame<CardContent: Hashable> {
	private(set) var cards: [Card]
	private(set) var score: Int = 0
	
		
	init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
		self.cards = []
		//add numbers of pairs cards x 2 cards
		
		for pairIndex in 0..<max(2, numberOfPairsOfCards) {
			let content = cardContentFactory(pairIndex)
			cards.append(Card(content: content))
			cards.append(Card(content: content))
		}
	}
	
	var indexOfTheOneAndOnlyFaceUpCard: Int? {
		get { cards.indices.filter({ index in cards[index].isFaceUp}).only }
		set { cards.indices.forEach({ cards[$0].isFaceUp = ( newValue == $0 )}) }
	}
	
	mutating func choose(_ card: Card) {
		debugPrint("Choose",card)
		if let cardIndex = cards.firstIndex(where: { $0.id == card.id }) {
			if !cards[cardIndex].isFaceUp && !cards[cardIndex].isMatch {
				if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
					if cards[cardIndex].content == cards[potentialMatchIndex].content {
						cards[cardIndex].isMatch = true
						cards[potentialMatchIndex].isMatch = true
						score += 2
					} else {
						if cards[cardIndex].hasBeenSeen {
							score -= 1
						}
						
						if cards[potentialMatchIndex].hasBeenSeen {
							score -= 1
						}
					}
				} else {
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
		var isFaceUp: Bool = false {
			didSet {
				hasBeenSeen = oldValue && !isFaceUp
			}
		}
		
		var hasBeenSeen: Bool = false
		var isMatch: Bool = false
		let content: CardContent
	}
}


extension Array {
	var only: Element? {
		count == 1 ? first : nil
	}
}
