//
//  ChequeNumberScreen.swift
//  Semple
//
//  Created by brubru on 21.08.2024.
//

import SDKCom
import SwiftUI

struct ChequeNumberScreen: View {
	@State private var number = 0
	
	var body: some View {
		ChequeNumberView(number: number)
		Button("Увеличить") {
			number += 1
		}
		.padding()
	}
}

#Preview {
    ChequeNumberScreen()
}
