//
//  SheetModifier.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 21.04.2024.
//

import SwiftUI

public struct SheetModifier: ViewModifier {
	@Binding var isShow: Bool
	let sheetData: SheetViewModel
    
    public func body(content: Content) -> some View {
        ZStack {
            content
                .sheet(isPresented: $isShow) {
					SheetView(isShow: $isShow,
							  title: sheetData.title,
							  subTitle: sheetData.subTitle,
							  buttons: sheetData.buttons)
                        .presentationDetents([.fraction(0.4),.medium])
                        .presentationDragIndicator(.automatic)
                }
        }
    }
}

#Preview {
	 Text("Hi")
		.sheetModifier(isShow: .constant(true), 
					   sheetData: SheetViewModel(title: "Text"))
}
