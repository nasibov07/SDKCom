import Foundation
import Combine

public final class AppAlert: ObservableObject {
    public static var shared: AppAlert = .init()
    private init() { }
    
    @Published var alert: AlertObject? = nil
    
    public func show(title: String, subTitle: String, buttons: [AlertButton]) {
        alert = AlertObject(title: title, subTitle: subTitle, buttons: buttons)
    }
    
    public func remove() { alert = nil }
}

public struct AlertObject {
    public var title: String
    public var subTitle: String
    public var buttons: [AlertButton]
}
