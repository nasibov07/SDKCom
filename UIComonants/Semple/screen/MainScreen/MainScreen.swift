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
                
                Spacer()
            })
        }
    }
}

#Preview {
    MainScreen()
        .environmentObject(MainScreenViewModel())
}
