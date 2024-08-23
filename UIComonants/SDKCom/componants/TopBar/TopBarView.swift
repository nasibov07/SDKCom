//
//  TopBarView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import SwiftUI

public struct TopBarView: View {
	private let title: String
	private let backButton: VoidBlock?
	
	public init(
		title: String,
		backButton: VoidBlock? = nil
	) {
		self.title = title
		self.backButton = backButton
	}
	
	public var body: some View {
		VStack(spacing: 20) {
			ZStack {
				if let backButton {
					ArrowButtonView(
						color: AppColor.AppDark.color,
						action: backButton
					)
				}
				logoScreen()
			}
			titleScreen()
		}
		.frame(width: getWidth())
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
	TopBarView(title: "Как вас зовут?") {}
}
