//
//  EmojiArt.swift
//  EmojiArt
//
//  Created by sudhir on 08/12/25.
//

import Foundation

struct EmojiArt: Identifiable {
	let id: String = UUID().uuidString
	var background: URL?
	var emoji = [Emoji]()
	
	struct Emoji {
		let string: String
		var positon: Position
		let size: Int
		
		struct Position {
			var x: Int
			var y: Int
		}
	}
}
