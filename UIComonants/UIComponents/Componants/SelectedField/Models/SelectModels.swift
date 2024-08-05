//
//  SelectModels.swift
//  UIComonants
//
//  Created by Ровшан Насибов on 01.08.2024.
//

import Foundation

public protocol PointModelProtocol {
    var value: String? { get set }
    var name: String? { get set }
}

public struct PointModel: PointModelProtocol, Identifiable, Codable {
    public var id = UUID().uuidString
    public var value: String?
    public var name: String?
    
    public init(id: String = UUID().uuidString, value: String? = nil, name: String? = nil) {
        self.id = id
        self.value = value
        self.name = name
    }
}
