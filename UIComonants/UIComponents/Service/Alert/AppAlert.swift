import Foundation
import Combine

public class AppAlert: ObservableObject {
    static var shared: AppAlert = .init()
    private init() { }
    
    @Published var alert: AlertObject? = nil
    
    func show(title: String, subTitle: String, buttons: [AlertButton]) {
        self.alert = AlertObject(title: title, subTitle: subTitle, buttons: buttons)
    }
    
    func remove() { self.alert = nil }
}

struct AlertObject {
    var title: String
    var subTitle: String
    var buttons: [AlertButton]
}
