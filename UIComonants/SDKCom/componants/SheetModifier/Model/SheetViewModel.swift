//
//  SheetViewModel.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 21.04.2024.
//

import Foundation
 
public struct SheetViewModel {
   	public var title: String
	public var subTitle: String? = nil
	public var isShow: Bool = false
	public var buttons: [SheetViewButtonModel]? = nil
	
	public init(
		title: String,
		subTitle: String? = nil,
		isShow: Bool = false,
		buttons: [SheetViewButtonModel]? = nil
	) {
		self.title = title
		self.subTitle = subTitle
		self.isShow = isShow
		self.buttons = buttons
	}
}

public struct SheetViewButtonModel: Identifiable {
    public var id = UUID().uuidString
    let state: ButtonState
    let appearance: TitleObject
	let action: () -> ()
	
	public init(
		id: String = UUID().uuidString, 
		state: ButtonState,
		appearance: TitleObject,
		action: @escaping () -> Void
	) {
		self.id = id
		self.state = state
		self.appearance = appearance
		self.action = action
	}
}
