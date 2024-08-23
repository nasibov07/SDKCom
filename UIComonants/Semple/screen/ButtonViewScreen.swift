//
//  ButtonViewScreen.swift
//  Semple
//
//  Created by brubru on 21.08.2024.
//
import SDKCom
import SwiftUI

struct ButtonViewScreen: View {
	private let buttonStates: [ButtonState] = [
		.activeBlue, .activeRed, .activeWhite, .disable, .load
	]
	@State private var buttonState: ButtonState = .activeBlue
	@State private var width: CGFloat = 200
	@State private var isShow = false
	
    var body: some View {
		VStack {
			ButtonView(
				state: buttonState,
				title: .birthday,
				width: width
			)
			Menu {
				ForEach(buttonStates, id: \.self) { state in
					Button("\(state)") {
						buttonState = state
					}
				}
			} label: {
				Label("Стиль кнопки", systemImage: "ellipsis.circle")
					.font(.title3)
					.padding()
			}
			HStack {
				Text("width")
				Slider(value: $width, in: 1...getWidth(), step: 1)
				Text(width.formatted())
			}
			.padding(.horizontal, 40)
		}
    }
}

#Preview {
    ButtonViewScreen()
}
