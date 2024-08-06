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
    
    // Start the timer with the given amount of minutes
    func start(minutes: Float) {
        self.initialTime = Int(minutes)
        self.endDate = Date()
        self.isActive = true
        self.endDate = Calendar.current.date(byAdding: .minute, value: Int(minutes), to: endDate)!
    }
    
    // Reset the timer
    func reset() {
        self.minutes = Float(initialTime)
        self.isActive = false
        self.time = "\(Int(minutes)):00"
    }
    
    // Show updates of the timer
    func updateCountdown(){
        guard isActive else { return }
        
        // Gets the current date and makes the time difference calculation
        let now = Date()
        let diff = endDate.timeIntervalSince1970 - now.timeIntervalSince1970
        
        // Checks that the countdown is not <= 0
        if diff <= 0 {
            self.isActive = false
            self.time = "00:00"
            self.showingAlert = true
            return
        }
        
        // Turns the time difference calculation into sensible data and formats it
        let date = Date(timeIntervalSince1970: diff)
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        let hour = (calendar.component(.hour, from: date) - 4)

        self.minutes = Float(minutes)
        
        if hour >= 1 {
            self.time = "\(getHour(hour)):\(getMin(minutes)):\(getSec(seconds))"
        } else {
            self.time = "\(getMin(minutes)):\(getSec(seconds))"
        }
    }
    
    private func getHour(_ hour: Int) -> String {
        return hour < 10 ? "0\(hour)" : "\(hour)"
    }
    
    private func getMin(_ min: Int) -> String {
        return min < 10 ? "0\(min)" : "\(min)"
    }
    
    private func getSec(_ sec: Int) -> String {
        return sec < 10 ? "0\(sec)" : "\(sec)"
    }
}
