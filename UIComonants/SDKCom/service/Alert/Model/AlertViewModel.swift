//
//  AlertViewModel.swift
//  SDKCom
//
//  Created by brubru on 26.08.2024.
//

import Foundation

public struct AlertViewModel {
	public let title: String
	public var subTitle: String?
	public var buttons: [AlertButtonModel]?
	
	public init(
		title: String,
		subtitle: String? = nil,
		buttons: [AlertButtonModel]? = nil
	) {
		self.title = title
		self.subTitle = subtitle
		self.buttons = buttons
	}
}
