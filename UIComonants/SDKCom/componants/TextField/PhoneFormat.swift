//
//  PhoneFormat.swift
//  SDKCom
//
//  Created by brubru on 18.08.2024.
//

import Foundation

final class PhoneFormat {
	class func format(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
		let regex = try! NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive)
		let maxСharLimit = 11
		
		guard !(shouldRemoveLastDigit && phoneNumber.count <= 0) else { return "" }
		let range = NSString(string: phoneNumber).range(of: phoneNumber)
		var number = regex.stringByReplacingMatches(in: phoneNumber,
													options: [],
													range: range,
													withTemplate: "")
		
		if number.count > maxСharLimit {
			let maxIndex = number.index(number.startIndex, offsetBy: maxСharLimit)
			number = String(number[number.startIndex..<maxIndex])
		}
		
		if shouldRemoveLastDigit {
			let maxIndex = number.index(number.startIndex, offsetBy: number.count)
			number = String(number[number.startIndex..<maxIndex])
		}
		
		let maxIndex = number.index(number.startIndex, offsetBy: number.count)
		let regRange = number.startIndex..<maxIndex
		
		let type: NumberReg = processing(count: number.count)
		
		number = number.replacingOccurrences(of: type.pattern,
											 with: type.behaviour,
											 options: .regularExpression,
											 range: regRange)
		
		return "+" + number
	}
	
	class func processing(count i: Int) -> NumberReg {
		switch i {
		case 0..<5:  return .firstStages
		case 5..<8:  return .secondStages
		case 8..<10: return .thereStages
		default: return .fourthStages
		}
	}
}
