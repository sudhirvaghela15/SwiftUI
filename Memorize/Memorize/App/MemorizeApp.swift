//
//  MemorizeApp.swift
//  Memorize
//
//  Created by sudhir on 18/11/25.
//

import SwiftUI

@main
struct MemorizeApp: App {
	@State var viewModel: EmojiMemoryGame = .init()
    var body: some Scene {
        WindowGroup {
			EmojiMemoryGameView(emojiMemoryGame: viewModel)
        }
    }
}
