//
//  ListValueScreen.swift
//  Semple
//
//  Created by brubru on 21.08.2024.
//
import SDKCom
import SwiftUI

struct ListValueScreen: View {
	@State private var cities = ["Москва", "Уфа", "Саратов"]
	@State private var showTitle = true
	
    var body: some View {
		VStack {
			Button(action: { showTitle.toggle() }) {
				Text(showTitle ? "Скрыть заголовок" : "Показать заголокок")
			}
			.padding(.top, 30)
			if showTitle {
				ListValue(
					title: "Город",
					list: cities) { value in
						print(value)
					}
			} else {
				ListValue(list: cities) { value in
					print(value)
				}
			}
		}
    }
}

#Preview {
    ListValueScreen()
}
