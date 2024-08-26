//
//  OrderSelectedCell.swift
//  BratishkaClient
//
//  Created by Ровшан Насибов on 29.06.2024.
//

import SwiftUI

public struct SelectedCell: View {
    @Binding public var title: PointModel?
    @Binding public var description: PointModel?
    
    public var body: some View {
        VStack {
            HStack {
                titlePanel()
                Spacer()
                changeView()
            }
            .padding(15)
        }
        .frame(maxWidth: .infinity, maxHeight: 55)
        .background(.white)
        .cornerRadius(10)
        .shadow()
    }
    
    private func changeView() -> some View {
        Text("Изменить")
            .bold()
            .foregroundStyle(AppColor.AppBlue.color)
    }
    
    private func titlePanel() -> some View {
        VStack(alignment: .leading, content: {
            if let title = title?.name {
                Text(title)
                    .bold()
                    .foregroundStyle(AppColor.AppDark.color)
            }
            
            
            if let value = description?.name {
                Text(value)
                    .foregroundStyle(AppColor.AppGray.color)
            }
        })
    }
}

#Preview {
    SelectedCell(
		title: .constant(PointModel(value: "значение", name: "имя")),
		description: .constant(PointModel(value: "значение", name: "имя")))
}
