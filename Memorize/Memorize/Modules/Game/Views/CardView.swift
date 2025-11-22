//
//  CardView.swift
//  Memorize
//
//  Created by sudhir on 22/11/25.
//

import SwiftUI

struct CardView: View {
	
	private let card: MemoryGame<String>.Card
	
	init(_ card: MemoryGame<String>.Card) {
		self.card = card
	}
	
	var body: some View {
		ZStack {
			let roundRect = RoundedRectangle(
				cornerRadius: Constant.cornerRadius
			)
			
			Group {
				roundRect.fill(.white)
				roundRect.strokeBorder(lineWidth: Constant.lineWidth)
				Text(card.content)
					.font(.system(size: Constant.FontSize.largetst))
					.minimumScaleFactor(Constant.FontSize.scaleFactor)
					.fontWeight(.bold)
					.aspectRatio(1, contentMode: .fit)
			}.opacity(card.isFaceUp ? 1 : 0)
			
			roundRect.opacity(card.isFaceUp ? 0 : 1)
		}.opacity(card.isFaceUp || !card.isMatch ? 1 : 0)
	}
}

private extension CardView {
	enum Constant {
		static let cornerRadius: CGFloat = 12
		static let lineWidth: CGFloat = 2
		static let inset: CGFloat  = 5
		
		enum FontSize {
			static let largetst: CGFloat = 200
			static let smallets: CGFloat = 10
			static let scaleFactor: CGFloat = smallets / largetst
		}
	}
}
