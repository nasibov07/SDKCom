//
//  CapBarView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import SwiftUI

public struct CapBarView: View {
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
        ZStack {
			if let backButton {
				ArrowButtonView(
					color: AppColor.AppWhite.color,
					action: backButton
				)
			}
            titleScreen()
        }
        .frame(width: getWidth())
        .background(AppColor.AppBlue.color)
    }
    
    private func titleScreen() -> some View {
        Text(title)
            .bold()
            .padding()
            .lineLimit(3)
            .foregroundStyle(AppColor.AppWhite.color)
            .fixedSize(horizontal: false, vertical: true)
            .multilineTextAlignment(.center)
            .frame(width: getWidth() - 80, alignment: .center)
    }
}

#Preview {
    CapBarView(title: "Как вас зовут?") { }
}
