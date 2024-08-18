//
//  CapBarView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import SwiftUI

public struct CapBarView: View {
    public typealias VoidBlock = () -> ()
    
    public var title: String
    public var showArrow: Bool
    
    private let backButton: VoidBlock
    
    public init(
		title: String,
		showArrow: Bool = true,
		backButton: @escaping VoidBlock
	) {
        self.title = title
        self.showArrow = showArrow
        self.backButton = backButton
    }
    
    public var body: some View {
        ZStack {
            if showArrow { arrowScreen() }
            titleScreen()
        }
        .frame(width: getWidth())
        .background(AppColor.AppBlue.color)
    }
    
    private func arrowScreen() -> some View {
        HStack {
            Image(systemName: "chevron.left")
                .padding()
                .foregroundStyle(AppColor.AppWhite.color)
                .onTapGesture { backButton() }
            Spacer()
        }
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
    CapBarView(title: "Как вас зовут?", showArrow: false) { }
}
