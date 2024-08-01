import Foundation
import SwiftUI

/// Перечисление названий иконок, которые используются в приложении.
/// Название иконки с типом String.
/// ```
/// Пример: SDKIcon.gid
/// ```
enum AppImage: String {
    case offShowPassword = "offShowPassword"
    case onShowPassword = "onShowPassword"
    case logoBarber = "logoBratishka"
    case clearIcon = "clearIcon"
    case helpImage = "helpImage"
    case service = "service"
    case history = "history"
    case profile = "profile"
    case warning = "warning"
    case barber = "barber"
    case cheque = "cheque"
    case queue = "queue"
    
    var image: Image { Image(self.rawValue) }
}
