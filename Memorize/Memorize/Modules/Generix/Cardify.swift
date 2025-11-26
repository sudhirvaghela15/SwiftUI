//
//  Cardify.swift
//  Memorize
//
//  Created by sudhir on 22/11/25.
//

import SwiftUI

struct Cardify: ViewModifier, Animatable {
	
	private var isFaceUp: Bool  {
		rotation <  90
	}
	
	private var rotation: Double
	
	init(isFaceUp: Bool) {
		self.rotation = isFaceUp ? 0 : 180
	}
	
	var animatableData: Double {
		get { rotation }
		set { rotation = newValue }
	}
	
	func body(content: Content) -> some View {
		ZStack {
			let roundRect = RoundedRectangle(
				cornerRadius: Constant.cornerRadius
			)
			
			roundRect.strokeBorder(lineWidth: Constant.lineWidth)
			.background(roundRect.fill(.white))
			.overlay(content)
			.hide(!isFaceUp)
			
			roundRect
				.fill()
				.hide(isFaceUp)
		}.rotation3DEffect(.degrees(rotation), axis: (0, 1 , 0))
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

