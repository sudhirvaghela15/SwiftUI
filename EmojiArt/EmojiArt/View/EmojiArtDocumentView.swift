//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by sudhir on 08/12/25.
//

import SwiftUI

struct EmojiArtDocumentView: View {
	private let emojis =
["✌","😂","😝","😁","😱","👉","🙌","🍻","🔥","🌈","☀","🎈","🌹","💄","🎀","⚽","🎾","🏁","😡","👿","🐻","🐶","🐬","🐟","🍀","👀","🚗","🍎","💝","💙","👌","❤","😍","😉","😓","😳","💪","💩","🍸","🔑","💖","🌟","🎉","🌺","🎶","👠","🏈","⚾","🏆","👽","💀","🐵","🐮","🐩","🐎","💣","👃","👂","🍓","💘","💜","👊","💋","😘","😜","😵","🙏","👋","🚽","💃","💎","🚀","🌙","🎁","⛄","🌊","⛵","🏀","🎱","💰","👶","👸","🐰","🐷","🐍","🐫","🔫","👄","🚲","🍉","💛","💚"]
    var body: some View {
		VStack(spacing: 0) {
			documentView
			ScrollingEmojis(emojis: emojis)
		}
    }
	
	private var documentView: some View {
		Color.white
	}
}

struct ScrollingEmojis: View {
	
	let emojis: [String]
	
	private let palletEmojiSize: CGFloat = 40
	
	init(emojis: [String]) {
		self.emojis = Array(Set(emojis))
	}
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack {
				ForEach(emojis, id: \.self) { emoji in
					Text(emoji)
						.font(.system(size: palletEmojiSize))
						.padding(.horizontal)
				}
			}
		}
	}
}

#Preview {
    EmojiArtDocumentView()
}
