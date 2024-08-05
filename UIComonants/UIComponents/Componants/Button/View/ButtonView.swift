//
//  ButtonView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import SwiftUI

struct ButtonView: View {
    @Binding  var state: ButtonState
    @State  var title: TitleObject
    @State  var width: CGFloat
    
     init(state: Binding<ButtonState>, title: TitleObject, width: CGFloat) {
        self._state = state
        self.title = title
        self.width = width
    }
    
     var body: some View {
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

enum ButtonState {
    case activeBlue
    case activeWhite
    case disable
    case activeRed
    case load
    
    var background: Color {
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
    
    var foreground: Color {
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
