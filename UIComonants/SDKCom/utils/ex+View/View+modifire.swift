//
//  View+modifire.swift
//  SDKCom
//
//  Created by brubru on 08.08.2024.
//

import SwiftUI

public extension View {
	func sheetModifier(isShow: Binding<Bool>, sheetData: SheetViewModel) -> some View {
		self.modifier(SheetModifier(isShow: isShow, sheetData: sheetData))
	}
}
