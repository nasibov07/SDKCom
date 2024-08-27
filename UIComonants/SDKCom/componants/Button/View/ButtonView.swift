//
//  ButtonView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import SwiftUI

public struct ButtonView: View {
    private let state: ButtonState
    private let title: TitleObject
    private let width: CGFloat
    
    public init(
		state: ButtonState,
		title: TitleObject,
		width: CGFloat
	) {
        self.state = state
        self.title = title
        self.width = width
    }
    
    public var body: some View {
        VStack {
            if state != .load  {
                Text(title.rawValue)
            } else {
                ProgressView().tint(.white)
            }
        }
        .bold()
        .font(.system(size: 14))
        .foregroundStyle(state.foreground)
        .frame(width: width, height: 40)
        .background(state.background)
        .cornerRadius(12)
    }
}

#Preview {
    ButtonView(state: .activeBlue,
			   title: .cancel,
			   width: UIScreen.main.bounds.width - 40)
}
