//
//  AlertModifireScreen.swift
//  Semple
//
//  Created by brubru on 23.08.2024.
//

import SDKCom
import SwiftUI

struct AlertModifierScreen: View {
	@State private var isShowAlert = false
	
	var body: some View {
		VStack {
			Button("Show Alert") {
				isShowAlert = true
			}
			.padding()
		}
		.alertModifier(
			isShow: $isShowAlert,
			alertData: AlertViewModel(
				title: "Error",
				subtitle: "Что то пошло не так.",
				buttons: [
					AlertButtonModel(
						appearance: .base(.copy)) {
							isShowAlert = false
						},
					AlertButtonModel(
						appearance: .base(.cancel)) {
							isShowAlert = false
						},
					AlertButtonModel(
						appearance: .custom("Ok")) {
							isShowAlert = false
						}
				]
			)
		)
	}
}

#Preview {
	AlertModifierScreen()
}
