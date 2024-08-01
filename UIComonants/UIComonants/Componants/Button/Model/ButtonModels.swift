//
//  ButtonModels.swift
//  UIComonants
//
//  Created by Ровшан Насибов on 01.08.2024.
//

import Foundation
import SwiftUI

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
