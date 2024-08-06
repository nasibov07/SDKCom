//
//  TimerModels.swift
//  UIComponents
//
//  Created by Ровшан Насибов on 06.08.2024.
//

import Foundation
import SwiftUI

public enum CountTimerStateEnum {
    case wait, blocked, send
    
    public var title: String {
        switch self {
        case .wait: return TitleObject.Timer.wait.rawValue
        case .blocked: return TitleObject.Timer.wait.rawValue
        case .send: return TitleObject.Timer.send.rawValue
        }
    }
    
    public var foregroundColor: Color {
        switch self {
        case .wait: return AppColor.AppGray.color.opacity(0.6)
        case .blocked: return AppColor.AppGray.color.opacity(0.6)
        case .send: return AppColor.AppBlue.color
        }
    }
}
