//
//  TimerViewModel.swift
//  UIComponents
//
//  Created by Ровшан Насибов on 06.08.2024.
//

import Foundation

final class Watch: ObservableObject {
    @Published var isActive = false
    @Published var showingAlert = false
    @Published var time: String = "00:60"
    @Published var minutes: Float = 0
    
    private var initialTime = 0
    private var endDate = Date()
	
	func start(minutes: Float) {
		initialTime = Int(minutes)
		endDate = Date()
		isActive = true
		endDate = Calendar.current.date(byAdding: .minute, 
										value: Int(minutes),
										to: endDate)!
	}
	
	func reset() {
		minutes = Float(initialTime)
		isActive = false
		time = "\(Int(minutes)):00"
	}
	
    func updateCountdown(){
        guard isActive else { return }
        
        let now = Date()
        let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
        
        if diff <= 0 {
            isActive = false
            time = "00:00"
            showingAlert = true
            return
        }
        
        let date = Date(timeIntervalSince1970: diff)
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        let hour = (calendar.component(.hour, from: date) - 4)

        self.minutes = Float(minutes)
        
        if hour >= 1 {
            time = "\(getHour(hour)):\(getMin(minutes)):\(getSec(seconds))"
        } else {
            time = "\(getMin(minutes)):\(getSec(seconds))"
        }
    }
    
    private func getHour(_ hour: Int) -> String {
        hour < 10 ? "0\(hour)" : "\(hour)"
    }
    
    private func getMin(_ min: Int) -> String {
        min < 10 ? "0\(min)" : "\(min)"
    }
    
    private func getSec(_ sec: Int) -> String {
        sec < 10 ? "0\(sec)" : "\(sec)"
    }
}
