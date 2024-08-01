//
//  ButtonView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import SwiftUI

public struct ButtonView: View {
    @Binding public var state: ButtonState
    @State public var title: TitleObject
    @State public var width: CGFloat
    
    public init(state: Binding<ButtonState>, title: TitleObject, width: CGFloat) {
        self._state = state
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
    ButtonView(state: .constant(.load), title: .next, width: UIScreen.main.bounds.width - 40)
}

public enum ButtonState {
    case activeBlue
    case activeWhite
    case disable
    case activeRed
    case load
    
    public var background: Color {
        switch self {
        case .activeBlue:
            return AppColor.AppBlue.color
        case .activeWhite:
            return AppColor.AppWhite.color
        case .disable:
            return AppColor.AppGray.color
        case .load:
            return AppColor.AppBlue.color
        case .activeRed:
            return AppColor.AppWhite.color
        }
    }
    
    public var foreground: Color {
        switch self {
        case .activeBlue:
            return AppColor.AppWhite.color
        case .activeWhite:
            return AppColor.AppBlue.color
        case .disable:
            return AppColor.AppWhite.color
        case .load:
            return AppColor.AppWhite.color
        case .activeRed:
            return AppColor.AppRed.color
        }
    }
}
