//
//  TextViewModel.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import Foundation
import UIKit
import SwiftUI

struct ObjectContent {
    var text: String
    var maxLimitValue: Int
    var minLimitValue: Int
    var title: String
    var placeholder: String
    var keyboardActive: Bool
    var fieldEnum: CustomTextFieldEnum
    var state: TextFilderState
    var message: ObjectMessage
    var keyboardType: UIKeyboardType
    var disabled: Bool
    var countTimer: CountTimer
    var sheaker: CGFloat
    var mandatory: Bool
    var isEmpty: Bool { return text.isEmpty ? true : false }
    
    init(
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
    
    mutating func sayError() {
        state = .error
        message = ObjectMessage(id: 0, title: "Ошибка", show: true, state: .error)
    }
    
    mutating func sayEmpty(){
        guard isEmpty else { return }
        state = .error
        message = ObjectMessage(id: 0, title: "Заполните поле", show: true, state: .error)
    }
}

struct CountTimer {
    var canSend: CountTimerStateEnum
    var canSendCount: Int = 3
    var expired: Int = 0
}

struct ObjectMessage: Identifiable {
    var id: Int
    var title: String?
    var show: Bool
    var state: TextFilderState
    var icon: (error: String?, success: String?)
    
    init(id: Int,
         title: String? = nil,
         show: Bool = false,
         state: TextFilderState = .normal,
         icon: (error: String?, success: String?) = (nil,nil)) {
        self.id = id
        self.title = title
        self.show = show
        self.state = state
        self.icon = icon
    }
}

struct ObjectStateSetting {
    var foregroundColor: Color
    var backgroundColor: Color
    var borderColor: Color
    var borderWidth: Int
    
    init(foregroundColor: Color, backgroundColor: Color, borderColor: Color, borderWidth: Int) {
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
}

enum CustomTextFieldEnum {
    case phoneField, emailField, codeField, passwordField, birthdayField, passwordConfirmation
    case nameField, secondField
}
 
enum TextFilderState {
    case normal
    case atcive
    case error
    case success
    case fill
    
    var style: ObjectStateSetting {
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

enum NumberReg {
    case firstStages
    case secondStages
    case thereStages
    case fourthStages
    
    var pattern: String {
        switch self {
        case .firstStages:  return "(\\d)(\\d+)"
        case .secondStages: return "(\\d)(\\d{3})(\\d+)"
        case .thereStages:  return "(\\d)(\\d{3})(\\d{3})(\\d+)"
        case .fourthStages: return "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
        }
    }
    
    var behaviour: String {
        switch self {
        case .firstStages:  return "$1 ($2"
        case .secondStages: return "$1 ($2) $3"
        case .thereStages:  return "$1 ($2) $3-$4"
        case .fourthStages: return "$1 ($2) $3-$4-$5"
        }
    }
}
