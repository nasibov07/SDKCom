//
//  TextViewModel.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import Foundation
import UIKit
import SwiftUI

public struct ObjectContent {
    public var text: String
    public var maxLimitValue: Int
    public var minLimitValue: Int
    public var title: String
    public var placeholder: String
    public var keyboardActive: Bool
    public var fieldEnum: CustomTextFieldEnum
    public var state: TextFilderState
    public var message: ObjectMessage
    public var keyboardType: UIKeyboardType
    public var disabled: Bool
    public var countTimer: CountTimer
    public var sheaker: CGFloat
    public var mandatory: Bool
    public var isEmpty: Bool { return text.isEmpty ? true : false }
    
    public init(
        text: String = "",
        maxLimitValue: Int = 50,
        minLimitValue: Int = 0,
        title: String = "",
        placeholder: String = "",
        keyboardActive: Bool = false,
        fieldEnum: CustomTextFieldEnum = .nameField,
        state: TextFilderState = .normal,
        message: ObjectMessage = ObjectMessage(id: 0, icon: (nil,nil)),
        keyboardType: UIKeyboardType = UIKeyboardType.default,
        disabled: Bool = false,
        countTimer: CountTimer = CountTimer(canSend: .wait, canSendCount: 3, expired: 60),
        sheaker: CGFloat = 0,
        mandatory: Bool = false) {
            self.text = text
            self.maxLimitValue = maxLimitValue
            self.minLimitValue = minLimitValue
            self.title = title
            self.placeholder = placeholder
            self.keyboardActive = keyboardActive
            self.fieldEnum = fieldEnum
            self.state = state
            self.message = message
            self.keyboardType = keyboardType
            self.disabled = disabled
            self.countTimer = countTimer
            self.sheaker = sheaker
            self.mandatory = mandatory
        }
    
    public mutating func sayError() {
        state = .error
        message = ObjectMessage(id: 0, title: "Ошибка", show: true, state: .error)
    }
    
    public mutating func sayEmpty(){
        guard isEmpty else { return }
        state = .error
        message = ObjectMessage(id: 0, title: "Заполните поле", show: true, state: .error)
    }
}

public struct CountTimer {
    public var canSend: CountTimerStateEnum
    public var canSendCount: Int = 3
    public var expired: Int = 0
    
    public init(canSend: CountTimerStateEnum, canSendCount: Int, expired: Int) {
        self.canSend = canSend
        self.canSendCount = canSendCount
        self.expired = expired
    }
}

public struct ObjectMessage: Identifiable {
    public var id: Int
    public var title: String?
    public var show: Bool
    public var state: TextFilderState
    public var icon: (error: String?, success: String?)
    
    public init(id: Int, title: String? = nil, show: Bool = false, state: TextFilderState = .normal, icon: (error: String?, success: String?) = (nil,nil)) {
        self.id = id
        self.title = title
        self.show = show
        self.state = state
        self.icon = icon
    }
}

public struct ObjectStateSetting {
    public var foregroundColor: Color
    public var backgroundColor: Color
    public var borderColor: Color
    public var borderWidth: Int
    
    public init(foregroundColor: Color, backgroundColor: Color, borderColor: Color, borderWidth: Int) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
}

public enum CustomTextFieldEnum {
    case phoneField, emailField, codeField, passwordField, birthdayField, passwordConfirmation
    case nameField, secondField
}
 
public enum TextFilderState {
    case normal
    case atcive
    case error
    case success
    case fill
    
    public var style: ObjectStateSetting {
        switch self {
        case .normal: return ObjectStateSetting(foregroundColor: AppColor.AppDark.color,
                                                backgroundColor: AppColor.AppWhite.color,
                                                borderColor: AppColor.AppDark.color.opacity(0.5),
                                                borderWidth: 1)
        case .atcive: return ObjectStateSetting(foregroundColor: AppColor.AppDark.color,
                                                backgroundColor: AppColor.AppWhite.color,
                                                borderColor: AppColor.AppBlue.color.opacity(0.5),
                                                borderWidth: 1)
        case .error: return ObjectStateSetting(foregroundColor: AppColor.AppDark.color,
                                               backgroundColor: AppColor.AppRed.color.opacity(0.5),
                                               borderColor: AppColor.AppRed.color,
                                               borderWidth: 1)
        case .success: return ObjectStateSetting(foregroundColor: AppColor.AppGreen.color,
                                                 backgroundColor: AppColor.AppWhite.color,
                                                 borderColor: AppColor.AppGreen.color,
                                                 borderWidth: 1)
        case .fill: return ObjectStateSetting(foregroundColor: AppColor.AppDark.color,
                                              backgroundColor: AppColor.AppWhite.color,
                                              borderColor: AppColor.AppDark.color.opacity(0.5),
                                              borderWidth: 1)
        }
    }
}

public enum NumberReg {
    case firstStages
    case secondStages
    case thereStages
    case fourthStages
    
    public var pattern: String {
        switch self {
        case .firstStages:  return "(\\d)(\\d+)"
        case .secondStages: return "(\\d)(\\d{3})(\\d+)"
        case .thereStages:  return "(\\d)(\\d{3})(\\d{3})(\\d+)"
        case .fourthStages: return "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
        }
    }
    
    public var behaviour: String {
        switch self {
        case .firstStages:  return "$1 ($2"
        case .secondStages: return "$1 ($2) $3"
        case .thereStages:  return "$1 ($2) $3-$4"
        case .fourthStages: return "$1 ($2) $3-$4-$5"
        }
    }
}
