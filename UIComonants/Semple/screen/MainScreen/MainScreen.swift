//
//  Main.swift
//  Semple
//
//  Created by Ровшан Насибов on 06.08.2024.
//

import SwiftUI
import SDKCom


struct MainScreen: View {
	private enum SheetType: Identifiable {
		case buttonView
		case capBarView
		case chequeNumberView
		case listValue
		case sheetModifier
		case alertModifier
		
		var id: Int {
			hashValue
		}
	}
	
	@State private var selectedSheet: SheetType?
	
	var body: some View {
		Form {
			Section {
				Text("SDK Com")
				Text("Описание либы")
			}
			
			Section {
				Button("Кнопка | Button") {
					selectedSheet = .buttonView
				}
				
				Button("Кнопка | Cap Bar") {
					selectedSheet = .capBarView
				}
				
				Button("Кнопка | Cheque Number") {
					selectedSheet = .chequeNumberView
				}
				
				Button("Кнопка | ListValue") {
					selectedSheet = .listValue
				}
				
				Button("Кнопка | SheetModifier") {
					selectedSheet = .sheetModifier
				}
				
				Button("Кнопка | AlertModifier") {
					selectedSheet = .alertModifier
				}
			}
		}
		.sheet(item: $selectedSheet) { sheetType in
			switch sheetType {
			case .buttonView:
				ButtonViewScreen()
			case .capBarView:
				CapBarViewScreen()
			case .chequeNumberView:
				ChequeNumberScreen()
			case .listValue:
				ListValueScreen()
			case .sheetModifier:
				SheetModifierScreen()
			case .alertModifier:
				AlertModifierScreen()
			}
		}
	}
}


#Preview {
    MainScreen()
        .environmentObject(MainScreenViewModel())
}
