//
//  TopBarView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import SwiftUI

public struct TopBarView: View {
    public var title: String
    public var showArrow: Bool
    public let backButton: () -> ()
    
    public init(
		title: String,
		showArrow: Bool = true,
		backButton: @escaping () -> Void
	) {
        self.title = title
        self.showArrow = showArrow
        self.backButton = backButton
    }
    
    public var body: some View {
        VStack(spacing: 20) {
            ZStack {
                if showArrow { arrowScreen() }
                logoScreen()
            }
            titleScreen()
        }
        .frame(width: getWidth())
    }
    
    private func arrowScreen() -> some View {
        HStack {
            Image(systemName: "chevron.left")
                .padding()
                .onTapGesture { backButton() }
            Spacer()
        }
    }
    
    private func logoScreen() -> some View {
        AppImage.logoBarber.image
            .resizable()
            .frame(width: 70, height: 70)
    }
    
    private func titleScreen() -> some View {
        Text(title)
            .bold()
            .lineLimit(3)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
            .frame(width: getWidth() - 80, alignment: .center)
    }
}

#Preview {
    TopBarView(title: "Как вас зовут?") {  }
}
