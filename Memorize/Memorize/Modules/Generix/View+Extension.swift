//
//  View+Extension.swift
//  Memorize
//
//  Created by sudhir on 22/11/25.
//

import SwiftUI

extension View {
	func hide(_ value: Bool) -> some View {
		self.opacity(value ? 0 : 1)
	}
}
