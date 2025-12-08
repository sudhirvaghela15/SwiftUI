//
//  EmojiArtDocument.swift
//  EmojiArt
//
//  Created by sudhir on 08/12/25.
//

import SwiftUI
import Combine

final class EmojiArtDocument: ObservableObject {
	
	typealias Emoji = EmojiArt.Emoji
	
	private var emojiArt = EmojiArt()
	
	var emojis: [Emoji] {
		emojiArt.emoji
	}
	
	var background: URL? {
		emojiArt.background
	}
	
	// MARK: - Intent's
	
	func setBackground(_ url: URL?) {
		emojiArt.background = url
	}
}
