//
//  Main.swift
//  Semple
//
//  Created by Ровшан Насибов on 06.08.2024.
//

import SwiftUI
import SDKCom

struct MainScreen: View {
    @StateObject private var vm: MainScreenViewModel = .init()
	@State private var buttonState: ButtonState = .activeBlue
	@State private var isShow = false
    @FocusState var amountIsFocused: Bool
    
    var body: some View {
        ZStack {
            VStack(content: {
                TopBarView(title:  "Как вас зовут?", backButton: {
                    
                })
                
                Divider().padding()
                
                CustomTextFieldView(
                    frame: (getWidth() - 30, 0),
                    amountIsFocused: _amountIsFocused,
                    object: $vm.nameField) {
                    
                }
				
				ButtonView(
					state: buttonState,
					title: TitleObject.editEmail,
					width: 200
				)
				.onTapGesture {
					isShow.toggle()
				}
				.sheetModifier(
					isShow: $isShow,
					sheetData: SheetViewModel(
						title: "Это что такое??",
						subTitle: "Супер золотое",
						isShow: true,
						buttons: []
					)
				)
                
                Spacer()
            })
        }
    }
}

#Preview {
    MainScreen()
        .environmentObject(MainScreenViewModel())
}
