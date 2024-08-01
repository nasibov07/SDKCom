//
//  SheetModifier.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 21.04.2024.
//

import SwiftUI

struct SheetModifier: ViewModifier {
    @EnvironmentObject private var root: Root
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .frame(maxWidth: .infinity)
                .frame(maxHeight: .infinity)
                .background(AppColor.AppWhite.color)
                .foregroundColor(AppColor.AppDark.color)
                .font(.body)
            
            Button(action: {}, label: {})
                .sheet(isPresented: $root.sheetData.isShow, content: {
                    SheetView()
                        .presentationDetents([.fraction(0.4),.medium])
                        .presentationDragIndicator(.automatic)
                })
        }
    }
}

#Preview {
    SheetModifier() as! any View
}
