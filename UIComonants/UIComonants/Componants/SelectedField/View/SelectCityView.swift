//
//  SelectCityView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 17.04.2024.
//

import SwiftUI

public struct SelectCityView: View {
    @State var title: String
    @Binding var description: PointModel?
    
    init(title: String, description: Binding<PointModel?>) {
        self.title = title
        self._description = description
    }
    
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
    SelectCityView(title: "Ujhj", description: .constant(PointModel()))
}
