//
//  View+modifire.swift
//  SDKCom
//
//  Created by brubru on 08.08.2024.
//

import SwiftUI

public extension View {
	func sheetModifier(isShow: Binding<Bool>, sheetData: SheetViewModel) -> some View {
		modifier(SheetModifier(isShow: isShow, sheetData: sheetData))
	}
	
	func alertModifier(isShow: Binding<Bool>, alertData: AlertViewModel) -> some View {
		modifier(AlertModifier(isShow: isShow, alertData: alertData))
	}
}
