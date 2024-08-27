//
//  AlertModifire.swift
//  SDKCom
//
//  Created by brubru on 26.08.2024.
//

import SwiftUI

public struct AlertModifier: ViewModifier {
	@Binding var isShow: Bool
	let alertData: AlertViewModel
	
	public func body(content: Content) -> some View {
		ZStack {
			content
			if isShow {
				AlertView(isShow: $isShow, alertViewModel: alertData)
			}
		}
	}
}
