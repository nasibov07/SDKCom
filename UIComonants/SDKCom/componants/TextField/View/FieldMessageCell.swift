//
//  FieldMessageCell.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import SwiftUI

struct FieldMessageCell: View {
    @State var frame: (width: CGFloat, height: CGFloat)
    @Binding var object: ObjectContent
    
    var body: some View {
        if ((object.message.state == .error) || (object.message.state == .success)) {
            ZStack(content: {
                HStack(content: {
                    //MARK: -Икона сообщения
                    icons()
                    
                    //MARK: - Текст сообщения
                    textField()
                }).frame(width: frame.width - 30, alignment: .leading)
            })
        }
    }
    
    private func icons() -> some View {
        ZStack {
            HStack(spacing: 5, content: {
                if object.message.state == .error {
                    if let error = object.message.icon.error {
                        Image(error)
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(object.message.state == .error ? AppColor.AppGreen.color : AppColor.AppRed.color)
                    }
                }
                
                if object.message.state == .success {
                    if let success = object.message.icon.success {
                        Image(success)
                            .resizable()
                            .frame(width: 10, height: 10)
                            .foregroundColor(object.message.state == .success ? AppColor.AppGreen.color : AppColor.AppRed.color)
                    }
                }
            })
        }
    }
    
    private func textField() -> some View {
        HStack(content: {
            if let title = object.message.title {
                Text(title)
                    .foregroundColor(object.message.state == .success ? AppColor.AppGreen.color : AppColor.AppRed.color)
                    .font(.system(size: 12))
                Spacer()
            }
            
        })
    }
}

struct FieldMessageCell_Previews: PreviewProvider {
    static var previews: some View {
        FieldMessageCell(frame: (400,0),
                         object: .constant(ObjectContent(title: ".enterPhoneNuber",
                                                         placeholder: TitleObject.enterPhoneNuber.rawValue,
                                                         state: .error,
                                                         message: ObjectMessage(id: 0, title: "dfasdf",
                                                                                show: true,
                                                                                state: .success,
                                                                                icon: (nil,nil)))))
    }
}

