//
//  ArrowView.swift
//  SDKCom
//
//  Created by brubru on 21.08.2024.
//

import SwiftUI

struct ArrowButtonView: View {
	let color: Color
	let action: VoidBlock
	
    var body: some View {
		HStack {
			Image(systemName: "chevron.left")
				.padding()
				.foregroundStyle(color)
				.onTapGesture {
					action()
				}
			Spacer()
		}
    }
}

#Preview {
	ArrowButtonView(color: AppColor.AppDark.color) {}
}
