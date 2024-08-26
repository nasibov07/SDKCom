import Foundation

public struct AlertButton: Identifiable {
    public var id = UUID().uuidString
    public let action: () -> ()
    public let appearance: AlertButtonAppearance
	
	public init(
		id: String = UUID().uuidString,
		action: @escaping () -> Void,
		appearance: AlertButtonAppearance
	) {
		self.id = id
		self.action = action
		self.appearance = appearance
	}
}

public enum AlertButtonAppearance {
    case base(AlertButtonType)
    case custom(String)
    
    public var title: String {
        switch self {
        case .base(let alertButtonType): return alertButtonType.rawValue
        case .custom(let string): return string
        }
    }
    
    public var type: AlertButtonType {
        switch self {
        case .base(let alertButtonType): return alertButtonType
        case .custom(_): return AlertButtonType.normal
        }
    }
}

public enum AlertButtonType: String {
    case cancel = "Отменить"
    case copy = "Скопировать сообщение"
    case normal
}
