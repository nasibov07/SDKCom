//
//  SheetView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 21.04.2024.
//

import SwiftUI

public struct SheetView: View {
    @EnvironmentObject private var root: Root
    
    public var body: some View {
        VStack(alignment: .leading, content: {
            VStack(alignment: .leading, spacing: 15, content: {
                Spacer().frame(width: 1, height: 10)
                
                Text(root.sheetData.title)
                    .font(.system(size: 24))
                    .bold()
                
                if let des = root.sheetData.subTitle {
                    Text(des).font(.system(size: 16))
                }
                
                Spacer()
                
                if let buttons = root.sheetData.buttons {
                    VStack(spacing: 10, content: {
                        ForEach(buttons, id: \.id) { button in
                            Button(action: { 
                                button.action()
                                root.sheetData.isShow = false
                            }, label: {
                                ButtonView(state: .constant(button.state),
                                           title: button.appearance,
                                           width: getWidth() - 40)
                            })
                        }
                    })
                }
            })
            .frame(width: getWidth() - 40, alignment: .leading)
            .padding()
            Spacer()
        })
        .frame(maxWidth: .infinity)
        .background(AppColor.AppWhite.color)
        .cornerRadius(15)
        .overlay(content: {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(AppColor.AppBlue.color)
                        .padding()
                        .onTapGesture { root.sheetData.isShow = false }
                }
                Spacer()
            }
        })
    }
}

#Preview {
    SheetView().environmentObject(Root.shared)
}
