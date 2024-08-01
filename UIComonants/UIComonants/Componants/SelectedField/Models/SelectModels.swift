//
//  SelectModels.swift
//  UIComonants
//
//  Created by Ровшан Насибов on 01.08.2024.
//

import Foundation

protocol PointModelProtocol {
    var value: String? { get set }
    var name: String? { get set }
}

struct PointModel: PointModelProtocol, Identifiable, Codable {
    var id = UUID().uuidString
    var value: String?
    var name: String?
}
