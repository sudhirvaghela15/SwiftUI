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
		
		Pie(endAngle: .degrees(240))
			.opacity(Constant.Pie.opacity)
			.overlay {
				Text(card.content)
					.font(.system(size: Constant.FontSize.largetst))
					.minimumScaleFactor(Constant.FontSize.scaleFactor)
					.fontWeight(.bold)
					.aspectRatio(1, contentMode: .fit)
					.padding(Constant.Pie.inset)
				
			}.padding(Constant.inset)
			.cardify(card.isFaceUp)
			.hide(!(card.isFaceUp || !card.isMatch))
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
		
		enum Pie {
			static let inset: CGFloat  = 5
			static let opacity: CGFloat = 0.4
		}
	}
}
