//
//  ContentView.swift
//  Memorize
//
//  Created by sudhir on 18/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		HStack {
			CardView(isFaceUp: true)
			CardView()
			CardView()
			CardView()
		}
		.foregroundStyle(.orange)
		.padding()
		
    }
}

struct CardView: View {
	typealias Selection = () -> Void
	
	@State var isFaceUp: Bool = false
	
	var body: some View {
		ZStack {
			let roundRect = RoundedRectangle(cornerRadius: 12)
			
			if isFaceUp {
				roundRect.fill(.white)
				roundRect.strokeBorder(lineWidth: 2)
				Text("☠️")
					.font(.largeTitle)
					.fontWeight(.bold)
			} else {
				roundRect
			}
		}.onTapGesture {
			print("Tapped")
			isFaceUp.toggle()
		}
	}
}

#Preview {
    ContentView()
}
