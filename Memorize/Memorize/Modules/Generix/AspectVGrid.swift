//
//  AspectVGrid.swift
//  Memorize
//
//  Created by sudhir on 22/11/25.
//

import SwiftUI

struct AspectVGrid<Item: Identifiable, Content: View>: View {
	let items: [Item]
	var aspectRatio: CGFloat = 1
	var contentMode: ContentMode = .fit
	
	@ViewBuilder
	let content: (Item) -> Content

	var body: some View {
		GeometryReader { proxy in
			let gridItemSize = gridItemWidthFits(
				count: items.count,
				size: proxy.size,
				atAspectRation: aspectRatio
			)
			LazyVGrid(
				columns: [GridItem(.adaptive(minimum: gridItemSize), spacing: 0)],
				spacing: 0
			) {
				ForEach(items, content: { card in
				  content(card)
						.aspectRatio(aspectRatio, contentMode: contentMode)
			   })
			}
		}
	}
	
	private func gridItemWidthFits(
		count: Int,
		size: CGSize,
		atAspectRation aspectRatio: CGFloat
	) -> CGFloat {
		var columnCount = 1.0
		let count = CGFloat(count)
		repeat {
			let width = size.width / columnCount
			let height = width / aspectRatio
			let rowCount = (count / columnCount).rounded(.up)
			if rowCount * height < size.height {
				return (size.width / columnCount).rounded(.down)
			}
			
			columnCount += 1.0
		} while columnCount < count
		return min(size.width / count, size.height * aspectRatio).rounded(.down)
	}
}
