//
//  Shake.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import Foundation 
import SwiftUI

struct Shake: GeometryEffect {
    var amount: CGFloat = 5
    var shakesPerUnit = 10
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}
