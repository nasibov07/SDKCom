//
//  AlertModifireScreen.swift
//  Semple
//
//  Created by brubru on 23.08.2024.
//

import SDKCom
import SwiftUI

struct AlertModifireScreen: View {
	@StateObject private var appAlert = AppAlert.shared
	
	var body: some View {
		Text("Alert")
	}
}

#Preview {
	AlertModifireScreen()
}
