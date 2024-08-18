//
//  FieldValueView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 28.04.2024.
//

import SwiftUI

public struct FieldValueView: View {
	@Binding public var title: String?
	
    public var imageView: Image?
    public var comment: String?
    public var description: String?
    public var edit: Bool?
    public var warning: Bool?
    
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
                        Text(title)
							.bold()
							.font(.system(size: 16))
							.frame(alignment: .leading)
                    }
                     
                    if let value = comment {
                        Text(value)
                            .font(.system(size: 16))
                            .foregroundStyle(AppColor.AppGray.color)
                    }
                    
                    if let value = description {
                        Text(value)
                            .font(.system(size: 14))
                            .foregroundStyle(AppColor.AppBlue.color)
                    }
                }
                
                if let edit = edit, edit {
                    Spacer()
                    Text("Изменить")
                        .bold()
                        .font(.system(size: 16))
                        .foregroundStyle(AppColor.AppBlue.color)
                }
            }
            
            if let warning = warning, warning {
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
	FieldValueView(title: .constant("Революционная, 156"), 
				   imageView: AppImage.logoBarber.image,
				   comment: "Топ братишка",
				   description: nil,
				   edit: true,
				   warning: true)
}
