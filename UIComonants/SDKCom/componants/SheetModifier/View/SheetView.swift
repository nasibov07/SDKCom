//
//  SheetView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 21.04.2024.
//

import SwiftUI

struct SheetView: View {
	@Binding var isShow: Bool
	let title: String
	var subTitle: String?
	var buttons: [SheetViewButtonModel]?
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 15) {
                Spacer().frame(width: 1, height: 10)
                
                Text(title)
                    .font(.system(size: 24))
                    .bold()
                
                if let des = subTitle {
                    Text(des).font(.system(size: 16))
                }
                
                Spacer()
                
                if let buttons = buttons {
                    VStack(spacing: 10) {
                        ForEach(buttons, id: \.id) { button in
                            Button(action: {
                                button.action()
                                isShow = false
                            }, label: {
                                ButtonView(state: button.state,
                                           title: button.appearance,
                                           width: getWidth() - 40)
                            })
                        }
                    }
                }
            }
            .frame(width: getWidth() - 40, alignment: .leading)
            .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(AppColor.AppWhite.color)
        .cornerRadius(15)
        .overlay {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "x.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(AppColor.AppBlue.color)
                        .padding()
                        .onTapGesture { isShow = false }
                }
                Spacer()
            }
        }
    }
}

#Preview {
	SheetView(isShow: .constant(true), title: "Text")
}
