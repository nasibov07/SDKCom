import Foundation

public struct AlertButtonModel: Identifiable {
    public var id = UUID().uuidString
    public let appearance: AlertButtonAppearance
	public let action: () -> ()
	
	public init(
		id: String = UUID().uuidString,
		appearance: AlertButtonAppearance,
		action: @escaping () -> Void
	) {
		self.id = id
		self.appearance = appearance
		self.action = action
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
