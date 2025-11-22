//
//  Cardify.swift
//  Memorize
//
//  Created by sudhir on 22/11/25.
//

import SwiftUI

struct Cardify: ViewModifier {
	var isFaceUp: Bool
	
	func body(content: Content) -> some View {
		ZStack {
			let roundRect = RoundedRectangle(
				cornerRadius: Constant.cornerRadius
			)
			
			Group {
				roundRect.fill(.white)
				roundRect.strokeBorder(lineWidth: Constant.lineWidth)
				content
			} .hide(!isFaceUp) //.opacity(card.isFaceUp ? 1 : 0)
			
			roundRect
				.fill()
				.hide(isFaceUp) //opacity(card.isFaceUp ? 0 : 1)
		}
	}
	
	
	// MARK: - Constant's
	private enum Constant {
		static let cornerRadius: CGFloat = 12
		static let lineWidth: CGFloat = 2
	}
}


extension View {
	func cardify(_ value: Bool) -> some View {
		self.modifier(Cardify(isFaceUp: value))
	}
}

