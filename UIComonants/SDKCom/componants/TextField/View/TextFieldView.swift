	//
	//  TextFieldView.swift
	//  BaritshkaClient
	//
	//  Created by Ровшан Насибов on 31.03.2024.
	//

import SwiftUI

public struct CustomTextFieldView: View {
	public let frame: (width: CGFloat, height: CGFloat)
	@State private var showPassword = true
	@State private var textCount = 0
	@FocusState public var amountIsFocused: Bool
	@Binding public var object: ObjectContent
	
	public let onClickTimer: () -> ()
	
	public init(
		frame:(width: CGFloat, height: CGFloat),
		amountIsFocused: FocusState<Bool>,
		object: Binding<ObjectContent>,
		onClickTimer: @escaping () -> Void
	) {
		self.frame = frame
		self._amountIsFocused = amountIsFocused
		self._object = object
		self.onClickTimer = onClickTimer
	}
	
	public var body: some View {
		ZStack {
			VStack(spacing: 10) {
					//MARK: - Title элемента
				titleElement()
				bodyTextFieldView()
				bottomMessage()
			}
			.frame(width: frame.width - 20, alignment: .leading)
			.modifier(Shake(animatableData: CGFloat(object.sheaker)))
		}
		.animation(.easeOut, value: object.sheaker)
		.navigationBarHidden(true)
		.onChange(of: object.countTimer.canSendCount) { newValue in
			if object.fieldEnum == .codeField {
#warning("Эта строка в основном проекте закоменчена:")
				object.disabled = object.countTimer.canSendCount == 0
			}
		}
	}
	
	private func bodyTextFieldView() -> some View {
		HStack {
				//MARK: - Текстовое поле элемента
			textFieldElements()
			
				//MARK: - Иконки
			if object.fieldEnum != .codeField { iconElements() }
		}
		.modifier(CustomTextFieldDecorator(frame: frame, object: $object))
		.onAppear {
			if object.fieldEnum == .passwordField {
				showPassword = false
			}
		}
	}
	
	private func iconElements() -> some View {
		HStack(spacing: 5) {
				//MARK: - Иконка глаза
			if object.fieldEnum == .passwordField { eyesIcon() }
			
				//MARK: - Иконка удалить
				//скрыл пока что
				//clearIcon()
		}
	}
	
	private func titleElement() -> some View {
		HStack {
			Text(object.title)
				.font(.system(size: 12))
				.foregroundStyle(.gray)
			Spacer()
		}
		.frame(height: 15, alignment: .leading)
	}
	
	private func textFieldElements() -> some View {
		ZStack {
			if !showPassword {
				secureFieldElement()
			} else {
				textFieldElement()
			}
		}
	}
	
	private func textFieldElement() -> some View {
		TextField(
			object.placeholder,
			text: $object.text) { value in
				CustomTextFieldVM.onEditingChanged(in: &object, keyboard: value)
			}
			.onChange(of: object.text) { _ in
				CustomTextFieldVM.onChange(in: &object, old: &textCount)
			}
			.disableAutocorrection(true)
			.foregroundStyle(AppColor.AppDark.color)
			.keyboardType(object.keyboardType)
			.focused($amountIsFocused)
			.textInputAutocapitalization(.never)
			.disabled(object.disabled)
	}
	
	private func secureFieldElement() -> some View {
		SecureField(object.placeholder, text: $object.text)
			.onChange(of: object.text) { _ in
				CustomTextFieldVM.onChange(in: &object, old: &textCount)
			}
			.disableAutocorrection(true)
			.foregroundStyle(AppColor.AppDark.color)
			.keyboardType(object.keyboardType)
			.focused($amountIsFocused)
			.textInputAutocapitalization(.never)
			.disabled(object.disabled)
	}
	
	private func bottomMessage() -> some View {
		VStack(spacing: 20) {
			FieldMessageCell(frame: frame, object: $object)
#warning("Эта строка в основном проекте закоменчена:")
			if object.fieldEnum == .codeField { countTime() }
		}
	}
	
#warning("Этот метод в основном проекте закоменчен:")
	private func countTime() -> some View {
		VStack(spacing: 0) {
			AuthTimer(countTimer: $object.countTimer){
				self.amountIsFocused = false
				if object.countTimer.canSendCount != 0 {
					object.countTimer.canSendCount -= 1
					object.countTimer.canSend = .wait
					object.countTimer.expired = 90
				} else {
					object.countTimer.canSend = .blocked
				}
				
				CustomTextFieldVM.clear(in: &object)
				onClickTimer()
			}
		}
	}
	
	private func clearIcon() -> some View {
		AppImage.clearIcon.image
			.resizable()
			.scaledToFit()
			.frame(width: 25, height: 25, alignment: .center)
			.opacity(object.text.isEmpty ? 0 : 1)
	}
	
	private func eyesIcon() -> some View {
		VStack {
			if !showPassword {
				AppImage.onShowPassword.image.resizable()
			} else {
				AppImage.offShowPassword.image.resizable()
			}
		}
		.scaledToFit()
		.frame(width: 25, height: 25, alignment: .center)
		.opacity(object.text.isEmpty ? 0 : 1)
		.onTapGesture { showPassword.toggle() }
	}
	
	private struct CustomTextFieldDecorator: ViewModifier {
		var frame: (width: CGFloat, height: CGFloat)
		@Binding var object: ObjectContent
		
		func body(content: Content) -> some View {
			content
				.padding()
				.frame(width: frame.width - 20, height: 55, alignment: .leading)
				.background(object.state.style.backgroundColor.opacity(0.2))
				.overlay(
					RoundedRectangle(cornerRadius: CGFloat(10))
						.stroke(object.state.style.borderColor, lineWidth: CGFloat(1))
				)
				.cornerRadius(10)
				.animation(.easeOut(duration: 0.3), value: object.text)
		}
	}
}

struct CustomTextFieldView_Previews: PreviewProvider {
	static var previews: some View {
		CustomTextFieldView(frame: (400,0), amountIsFocused: .init(),
							object: .constant(ObjectContent(title: ".enterPassword",
															placeholder: TitleObject.password.rawValue,
															message: ObjectMessage(id: 0)))){ }
		
	}
}
