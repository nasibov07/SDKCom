import Foundation
import SwiftUI

/// Перечисление названий цветов, которые используются в приложении.
/// Название цвета с типом String.
/// ```
/// Пример: SDKColor.GIDBlue
/// ```
enum AppColor: String {
    case AppBlue
    case AppWhite
    case AppRed
    case AppGreen
    case AppGray
    case AppDark
    case AppBackground
     
    var color: Color { Color(self.rawValue) }
    var kitColor: UIColor { UIColor(named: self.rawValue) ?? UIColor() }
}

