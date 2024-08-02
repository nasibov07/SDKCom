//
//  ex+Double.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import Foundation
import SwiftUI
import UIKit

//MARK: - Double
extension Double {
    /// Может вернуть время в формате
    /// 10000.asString(style: .positional)     // 2:46:40
    /// 10000.asString(style: .abbreviated) // 2h 46m 40s
    /// 10000.asString(style: .short)            // 2 hr, 46 min, 40 sec
    /// 10000.asString(style: .full)                // 2 hours, 46 minutes, 40 seconds
    /// 10000.asString(style: .spellOut)       // two hours, forty-six minutes, forty seconds
    /// 10000.asString(style: .brief)              // 2hr 46min 40sec
    public func asString(style: DateComponentsFormatter.UnitsStyle) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second, .nanosecond]
        formatter.unitsStyle = style
        formatter.calendar?.locale = Locale(identifier: "ru_RU")
        return formatter.string(from: self) ?? ""
    }
}
