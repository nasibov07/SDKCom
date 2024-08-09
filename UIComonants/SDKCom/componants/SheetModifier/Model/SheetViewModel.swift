//
//  SheetViewModel.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 21.04.2024.
//

import Foundation
 
public struct SheetViewModel {
   	var title: String
    var subTitle: String? = nil
    var isShow: Bool = false
    var buttons: [SheetViewButtonModel]? = nil
	
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
    let action: () -> ()
    let state: ButtonState
    let appearance: TitleObject
}
