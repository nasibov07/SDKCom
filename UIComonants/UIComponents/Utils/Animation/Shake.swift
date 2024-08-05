//
//  Shake.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import Foundation 
import SwiftUI

public struct Shake: GeometryEffect {
    public var amount: CGFloat = 5
    public var shakesPerUnit = 10
    public var animatableData: CGFloat

    public func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}
