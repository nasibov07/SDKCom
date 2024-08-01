
import Foundation
import SwiftUI
import Combine

/// Объект для уравнения навигацией. Позволяет перемешаться между Screen в приложении.
///
/// Создаем экземпляр Root и передаем через .environmentObject( )
///
///     @main
///     struct GIDSDKMain: App {
///         var body: some Scene {
///             WindowGroup {
///                 ContentView().environmentObject(Root.shared)
///             }
///         }
///     }
///
/// Добавляем в ContentView( )  навигационный стек.
/// Создать экземпляр Root через @EnvironmentObject
/// Увеличить версию проекта до iOS16.
/// Указываем пункт назначение .navigationDestination( ), сообщаем куда мы хотим перемеситься далее
///
///     @EnvironmentObject private var root: Root
///     NavigationStack(path: $root.path){
///         root.core.screen
///     }
///     .navigationDestination(for: Screen.self) {
///         $0.screen
///     }
///

public class Root: ObservableObject {
    static var shared: Root = .init()
    private init() { }
    
    @Published var core: Screen = Screen(screen: AnyView(EmptyView()))
    @Published var path: NavigationPath = .init()
    
    @Published var sheetData: SheetViewModel = .init(title: "Сообщение")
    
    /// Для перехода на следующее окно, необходимо вызвать
    /// метод .push(_ view: some View) и передать в нее нужный Screen
    ///
    ///     @EnvironmentObject private var root: Root
    ///     ...
    ///     root.push(MobileLiteView(state: .mobileLite, viewModel: MobileLiteViewModel()))
    func push(_ view: some View) { self.path.append(Screen(screen: AnyView(view))) }
    
    /// Для открытия окна sheetVIew
    func push(_ model: SheetViewModel) {
        self.sheetData = model
        self.sheetData.isShow = true
    }
    
    /// Для перехода на предыдущее окно, необходимо вызвать
    /// метод .pop( )
    ///
    ///     @EnvironmentObject private var root: Root
    ///     ...
    ///     root.pop()
    func pop() { self.path.isEmpty ? print("В доме") : self.path.removeLast() }
    
    /// Для перехода в корневое окно, необходимо вызвать
    /// метод .popToRoot( )
    ///
    ///     @EnvironmentObject private var root: Root
    ///     ...
    ///     root.popToRoot()
    func popToRoot() { self.path.removeLast(self.path.count) }
}

struct Screen: Identifiable, Hashable, Equatable {
    var id = UUID().uuidString
    var screen: AnyView
    
    init(screen: AnyView) { self.screen = screen }
    
    static func == (lhs: Screen, rhs: Screen) -> Bool { lhs.id == rhs.id }
    
    func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
