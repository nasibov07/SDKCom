//
//  SheetModifierScreen.swift
//  Semple
//
//  Created by brubru on 21.08.2024.
//
import SDKCom
import SwiftUI

struct SheetModifierScreen: View {
	@State private var isShow = false
	
	var body: some View {
		Button("Использовать модификатор") {
			isShow.toggle()
		}
		.sheetModifier(
			isShow: $isShow,
			sheetData: SheetViewModel(
				title: "Уверены, что хотите выйти?",
				subTitle: "Что бы войти заново, потребуется ввести номер телефона и пароль на странице входа",
				isShow: isShow,
				buttons: [
					SheetViewButtonModel(
						state: .activeBlue,
						appearance: TitleObject.yesExit) {
							isShow = false
						},
					SheetViewButtonModel(
						state: .activeWhite,
						appearance: TitleObject.cancel) {
							isShow = false
						}
				]
			)
		)
	}
}

#Preview {
    SheetModifierScreen()
}
