//
//  FlayingNumber.swift
//  Memorize
//
//  Created by sudhir on 27/11/25.
//

import SwiftUI

struct FlayingNumber: View {
	let number: Int
	
	@State private var offset: CGFloat = 0
	
    var body: some View {
		if number != 0 {
			Text(number, format: .number.sign(strategy: .always()))
				.font(.largeTitle)
				.foregroundStyle(number < 0 ? .red : .green)
				.shadow(color: .black, radius: 1.5, x: 1, y: 1)
				.offset(x: 0 , y: offset)
				.opacity(offset != 0 ? 0 : 1)
				.onAppear {
					withAnimation(.easeInOut(duration: 1.5)) {
						offset = number < 0 ? 200 : -200
					}
				}
				.onDisappear {
					offset = 0
				}
		}
    }
}

#Preview {
	FlayingNumber(number: 1)
}
