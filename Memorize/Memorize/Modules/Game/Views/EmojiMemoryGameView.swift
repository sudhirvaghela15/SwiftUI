//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by sudhir on 18/11/25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
	
//	@State var viewModel: EmojiMemoryGame = .init()
	var viewModel: EmojiMemoryGame
	private let aspectRatio: CGFloat = 2/3
	private let spacing: CGFloat = 4
	
    var body: some View {
	
		VStack {
			cards
				.animation(.default, value: viewModel.cards)
				.foregroundStyle(viewModel.color)
			Button(action: viewModel.shuffle, label: {
				Text("Shuffle")
			})
		}
		.padding()
		
    }
	
	@ViewBuilder
	private var cards: some View {
		AspectVGrid(
			items: viewModel.cards,
			aspectRatio: aspectRatio,
			content: { card in
				CardView(card)
					.padding(spacing)
					.onTapGesture { _ in viewModel.choose(card) }
			})
	}
}

#Preview {
	@Previewable @State var viewModel: EmojiMemoryGame = .init()
	EmojiMemoryGameView(viewModel: viewModel)
}
