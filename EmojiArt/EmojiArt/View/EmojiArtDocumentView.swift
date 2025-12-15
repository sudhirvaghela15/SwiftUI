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
		VStack {
			Color.yellow
			ScrollingEmojis(emojis: emojis)
		}
    }
}

struct ScrollingEmojis: View {
	
	let emojis: [String]
	
	init(emojis: [String]) {
		self.emojis = emojis
	}
	
	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack {
				ForEach(emojis, id: \.self) { emoji in
					Text(emoji)
						.font(.largeTitle)
				}
			}
		}
	}
}

#Preview {
    EmojiArtDocumentView()
}
