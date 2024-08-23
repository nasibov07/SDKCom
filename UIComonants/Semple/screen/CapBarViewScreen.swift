//
//  CapBarViewScreen.swift
//  Semple
//
//  Created by brubru on 21.08.2024.
//

import SDKCom
import SwiftUI

struct CapBarViewScreen: View {
	@State private var showArrow = false
	@Environment(\.presentationMode) var presentationMode
	
	var body: some View {
		if showArrow {
			CapBarView(title: "Cap Bar Title")
		} else {
			CapBarView(title: "Cap Bar Title") {
				presentationMode.wrappedValue.dismiss()
			}
		}
		Button(action: { showArrow.toggle() }) {
			let title = showArrow 
			?  "Можно с кнопкой back"
			: "Можно без кнопкой back"
			
			Text(title)
		}
		.padding()
	}
}

#Preview {
	CapBarViewScreen()
}
