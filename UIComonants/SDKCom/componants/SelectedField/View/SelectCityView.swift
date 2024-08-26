//
//  SelectCityView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 17.04.2024.
//

import SwiftUI

public struct SelectCityView: View {
	@Binding public var description: PointModel?
	
    public var title: String
    
    public var body: some View {
        VStack {
            HStack {
                cityPanel()
                Spacer()
                changeView()
            }
            .padding(15)
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(15)
        .shadow()
        .padding(10)
    }
    
    private func changeView() -> some View {
        Text("Изменить")
            .bold()
            .foregroundStyle(AppColor.AppBlue.color)
    }
    
    private func cityPanel() -> some View {
        VStack(alignment: .leading, content: {
            Text(title)
                .foregroundStyle(AppColor.AppGray.color)
            
            if let value = description?.name {
                Text(value)
                    .foregroundStyle(AppColor.AppDark.color)
            }
        })
    }
}

#Preview {
	SelectCityView(description: .constant(PointModel()), title: "Ujhj")
}
