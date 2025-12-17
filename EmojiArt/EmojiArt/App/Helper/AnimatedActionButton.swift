//
//  AnimatedActionButton.swift
//  EmojiArt
//
//  Created by sudhir on 17/12/25.
//

import SwiftUI

struct AnimatedActionButton: View {
	var title: String? = nil
	var systemImage: String? = nil
	var role: ButtonRole?
	let action: () -> Void
	
	init(
		title: String? = nil,
		systemImage: String? = nil,
		role: ButtonRole? = nil,
		action: @escaping () -> Void
	) {
		self.title = title
		self.systemImage = systemImage
		self.role = role
		self.action = action
	}
    
	var body: some View {
		Button(role: role, action: action, label: {
			if let title, title.isEmpty == false {
				Text(title)
			} else if let title, let systemImage {
				Label(title, image: systemImage)
			} else if let systemImage {
				Image(systemName: systemImage)
			}
		})
    }
}

#Preview {
	AnimatedActionButton( action: {
		
	})
}
