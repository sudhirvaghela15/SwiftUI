//
//  Extensions.swift
//  EmojiArt
//
//  Created by sudhir on 08/12/25.
//

import SwiftUI

typealias CGOffset = CGSize

extension CGRect {
	var center: CGPoint {
		CGPoint(x: midX, y: midY)
	}
	
	init(center: CGPoint, size: CGSize) {
		let origin = CGPoint(x: center.x-size.width/2, y: center.y-size.height/2)
		self.init(origin: origin, size: size)
	}
}

extension CGOffset {
	static func  +(lhs: CGOffset, rhs: CGOffset) -> CGOffset {
		let w = lhs.width + rhs.width
		let h = lhs.height + rhs.height
		return CGOffset(width: w, height: h)
	}
	
	static func  +=(lhs: inout CGOffset, rhs: CGOffset) {
		lhs = lhs + rhs
	}
}
