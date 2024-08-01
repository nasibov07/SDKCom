import Foundation

struct AlertButton: Identifiable {
    var id = UUID().uuidString
    let action: () -> ()
    let appearance: AlertButtonAppearance
}

enum AlertButtonAppearance {
    case base(AlertButtonType)
    case custom(String)
    
    var title: String {
        switch self {
        case .base(let alertButtonType): return alertButtonType.rawValue
        case .custom(let string): return string
        }
    }
    
    var type: AlertButtonType {
        switch self {
        case .base(let alertButtonType): return alertButtonType
        case .custom(_): return AlertButtonType.normal
        }
    }
}

enum AlertButtonType: String {
    case cancel = "Отменить"
    case copy = "Скопировать сообщение"
    case normal
}
