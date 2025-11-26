//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by sudhir on 18/11/25.
//

import SwiftUI

struct EmojiMemoryGameView: View {
	
//	@State var viewModel: EmojiMemoryGame = .init()
	@Bindable var emojiMemoryGame: EmojiMemoryGame
	private let aspectRatio: CGFloat = 2/3
	private let spacing: CGFloat = 4
	
    var body: some View {
	
		VStack {
			cards.foregroundStyle(emojiMemoryGame.color)
			bottomBar
		}
		.padding()
		
    }
	
	private  var bottomBar: some View {
		HStack {
			scoreView
			Spacer()
			shuffleView
		}.font(.largeTitle)
	}
	private var scoreView: some View {
		Text("Scor: \(emojiMemoryGame.score)")
			.animation(nil)
	}
	
	private var shuffleView: some View {
		Button(action: {
			withAnimation {
				emojiMemoryGame.shuffle()
			}
		}, label: {
			Text("Shuffle")
		})
	}
	
	@ViewBuilder
	private var cards: some View {
		AspectVGrid(
			items: emojiMemoryGame.cards,
			aspectRatio: aspectRatio,
			content: { card in
				CardView(card)
					.padding(spacing)
					.onTapGesture { _ in
						withAnimation {
							emojiMemoryGame.choose(card)
						}
					}
			})
	}
}

#Preview {
	@Previewable @State var viewModel: EmojiMemoryGame = .init()
	EmojiMemoryGameView(emojiMemoryGame: viewModel)
}
