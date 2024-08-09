import Foundation
import SwiftUI

/// Перечисление названий цветов, которые используются в приложении.
/// Название цвета с типом String.
/// ```
/// Пример: SDKColor.GIDBlue
/// ```
public enum AppColor: String {
    case AppBlue
    case AppWhite
    case AppRed
    case AppGreen
    case AppGray
    case AppDark
    case AppBackground
     
	public var color: Color {
		Color(self.rawValue)
	}
    public var kitColor: UIColor { UIColor(named: self.rawValue) ?? UIColor() }
}

