//
//  FlayingNumber.swift
//  Memorize
//
//  Created by sudhir on 27/11/25.
//

import SwiftUI

struct FlayingNumber: View {
	let number: Int
	
    var body: some View {
		if number != 0 {
			Text(number, format: .number.sign(strategy: .always()))
				.font(.largeTitle)
				.foregroundStyle(number < 0 ? .red : .green)
				.shadow(color: .black, radius: 2, x: 1, y: 1)
		}
    }
}

#Preview {
	FlayingNumber(number: 1)
}
