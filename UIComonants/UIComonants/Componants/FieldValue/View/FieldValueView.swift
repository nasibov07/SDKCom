//
//  FieldValueView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 28.04.2024.
//

import SwiftUI

public struct FieldValueView: View {
    @State var imageView: Image?
    @State var title: String?
    @State var comment: String?
    @State var description: String?
    @State var edit: Bool?
    @State var warning: Bool?
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if let image = imageView {
                    image
                        .resizable()
                        .frame(width: 32, height: 32)
                }
                 
                VStack(alignment: .leading) {
                    if let title = title {
                        Text(title).bold().font(.system(size: 16))
                    }
                     
                    if let value = comment {
                        Text(value)
                            .font(.system(size: 14))
                            .foregroundStyle(AppColor.AppGray.color)
                    }
                    
                    if let value = description {
                        Text(value)
                            .font(.system(size: 14))
                            .foregroundStyle(AppColor.AppBlue.color)
                    }
                }
                
                if let _ = edit, edit == true {
                    Spacer()
                    Text("Изменить")
                        .bold()
                        .font(.system(size: 16))
                        .foregroundStyle(AppColor.AppBlue.color)
                }
            }
            
            if let _ = warning, warning == true {
                HStack(spacing: 5, content: {
                    VStack {
                        AppImage.warning.image
                            .resizable()
                            .frame(width: 16, height: 16)
                        Spacer()
                    }.frame(height: 30)
                    
                    Text("Невозможно изменить. Для смены номера зарегистрируйтесь заново.")
                        .font(.system(size: 14))
                })
                .frame(maxWidth: .infinity, maxHeight: 35 ,alignment: .leading)
                .padding(8)
                .background(AppColor.AppBlue.color.opacity(0.1))
                .cornerRadius(10)
            }
        }
        .padding()
        .frame(maxWidth: getWidth() - 40, alignment: .leading)
        .background(.white)
        .cornerRadius(10)
        .shadow()
    }
}

#Preview {
    FieldValueView(imageView: AppImage.logoBarber.image, title: "Революционная, 156", comment: "Топ братишка", description: nil, warning: true)
}
