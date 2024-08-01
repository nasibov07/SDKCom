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
}

public struct SheetViewButtonModel: Identifiable {
    public var id = UUID().uuidString
    let action: () -> ()
    let state: ButtonState
    let appearance: TitleObject
}
