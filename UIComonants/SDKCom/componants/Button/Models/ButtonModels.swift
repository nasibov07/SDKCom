//
//  ButtonModels.swift
//  SDKCom
//
//  Created by Ровшан Насибов on 06.08.2024.
//

import Foundation
import SwiftUI

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
