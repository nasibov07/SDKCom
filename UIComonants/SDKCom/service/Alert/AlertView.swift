import SwiftUI

public struct AlertView: ViewModifier {
    @EnvironmentObject private var appAlert: AppAlert
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            if let _ = appAlert.alert { alert() }
        }
    }
    
    private var blurView: some View { Color.gray.opacity(0.2) }
    
    @ViewBuilder
    private func alert() -> some View {
        ZStack {
            blurView

            VStack(alignment: .center, spacing: 5) {
                if let title = appAlert.alert?.title {
                    Text(title)
                        .font(.system(size: 18).bold())
                        .padding(.top)
                }
                
                if let subTitle = appAlert.alert?.subTitle {
                    Text(subTitle)
                        .font( .system(size: 14, weight: .medium) )
                        .padding(.leading).padding(.trailing)
                        .multilineTextAlignment(.center)
                        .foregroundColor(AppColor.AppWhite.color)
                        .padding(.bottom, 5)
                }
                 
                if let buttons = appAlert.alert?.buttons {
                    VStack(spacing: 0, content: {
                        ForEach(buttons, id: \.id) { button in
                            alertButtonView(with: button.appearance.title) {
                                button.action()
                                if button.appearance.type == .copy { UIPasteboard.general.string = appAlert.alert?.subTitle }
                                if button.appearance.type == .cancel { appAlert.remove() }
                            }
                        }
                    })
                }
            }
            .background(AppColor.AppWhite.color)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.4), radius: 16, x: 0, y: 12)
            .padding(.horizontal, 50)
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    private func alertButtonView(with label: String, performance: @escaping () -> Void) -> some View {
        Button(action: performance) {
            VStack(spacing: 0) {
                Divider()
                
                Text(label)
                    .lineLimit(2)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(AppColor.AppWhite.color)
                    .padding()
            }
        }
    }
}
