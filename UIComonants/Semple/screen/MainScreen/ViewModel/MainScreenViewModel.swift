//
//  MainScreenViewModel.swift
//  Semple
//
//  Created by Ровшан Насибов on 06.08.2024.
//

import Foundation
import SDKCom

final class MainScreenViewModel: ObservableObject {
    @Published var nameField: ObjectContent = ObjectContent(
        maxLimitValue: 30,
        minLimitValue: 2,
        title: "Имя",
        placeholder: "Братишка",
        fieldEnum: .nameField,
        message: ObjectMessage(id: 0))
    
}
