import SwiftUI

struct AlertView: View {
	@Binding var isShow: Bool 
	let alertViewModel: AlertViewModel
	
	private var blurView: some View {
		Color.gray.opacity(0.7)
	}
    
	var body: some View {
		ZStack {
			blurView
			
			VStack(alignment: .center, spacing: 5) {
				Text(alertViewModel.title)
					.font(.system(size: 18)
					.bold())
					.padding(.top, 10)
				
				if let subTitle = alertViewModel.subTitle {
					Text(subTitle)
						.font(.system(size: 14, weight: .regular))
						.foregroundStyle(AppColor.AppDark.color)
						.multilineTextAlignment(.center)
						.padding(.bottom, 10)
						.padding(.horizontal, 20)
				}
				 
				if let buttons = alertViewModel.buttons {
					buttonStack(buttons: buttons)
				} else {
					defaultOkButton()
				}
			}
			.frame(width: getWidth() - 100)
			.background(Color.white.opacity(0.6))
			.cornerRadius(12)
			.shadow(color: Color.black.opacity(0.4), radius: 16, x: 0, y: 12)
			.padding(.horizontal, 50)
		}
		.edgesIgnoringSafeArea(.all)
    }
	
	@ViewBuilder
	private func buttonStack(buttons: [AlertButtonModel]) -> some View {
		VStack(spacing: 0) {
			ForEach(buttons, id: \.id) { button in
				alertButtonView(with: button.appearance.title) {
					button.action()
					handleButtonType(button.appearance.type)
				}
				.foregroundStyle(
					button.appearance.type == .cancel
					? Color.red
					: Color.blue
				)
			}
		}
	}

	private func defaultOkButton() -> some View {
		alertButtonView(with: "Ok") {
			isShow = false
		}
	}
	
    private func alertButtonView(
		with label: String,
		performance: @escaping () -> Void
	) -> some View {
        Button(action: performance) {
            VStack(spacing: 0) {
                Divider()
                
                Text(label)
                    .lineLimit(2)
                    .font(.system(size: 16, weight: .medium))
					.padding(10)
            }
			.padding(.horizontal, 20)
        }
    }
	
	private func handleButtonType(_ type: AlertButtonType) {
		if type == .copy {
			UIPasteboard.general.string = alertViewModel.subTitle
		}
		if type == .cancel {
			isShow = false
		}
	}
}

#Preview {
	AlertView(
		isShow: .constant(true),
		alertViewModel: AlertViewModel(
			title: "Error",
			   subtitle: "Мы не знаем что это такое. Если бы мы знали что это такое, но мы не знаем что это такое. Очень страшно",
			   buttons: [
				   AlertButtonModel(
					   appearance: .base(.copy)) {},
				   AlertButtonModel(
					   appearance: .base(.cancel)) {},
				   AlertButtonModel(
					   appearance: .custom("Ok")) {}
			   ]
		   )
	)
}
