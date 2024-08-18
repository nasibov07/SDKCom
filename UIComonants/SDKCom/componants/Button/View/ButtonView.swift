//
//  ButtonView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import SwiftUI

public struct ButtonView: View {
    public var state: ButtonState
    public var title: TitleObject
    public var width: CGFloat
    
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
        .foregroundColor(state.foreground)
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
