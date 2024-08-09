//
//  ChequeNumber.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 28.04.2024.
//

import SwiftUI

public struct ChequeNumberView: View {
    @State public var number: Int
    private var size: CGFloat { 150 }
    
    public init(number: Int) {
        self.number = number
    }
    
    public var body: some View {
        Circle()
            .frame(width: size)
            .foregroundStyle(AppColor.AppBlue.color)
            .overlay(content: {
                ZStack {
                    AppImage.cheque.image
                        .resizable()
                        .frame(maxWidth: size - 60, maxHeight: size - 35)
                    
					Text(number.formatted())
                        .bold()
                        .foregroundStyle(AppColor.AppBlue.color)
                        .font(.system(size: 38))
                }
            })
    }
}

#Preview {
    ChequeNumberView(number: 434)
}
