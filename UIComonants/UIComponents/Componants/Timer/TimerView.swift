//
//  TimerView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import SwiftUI
import Foundation
import Combine

public struct AuthTimer: View {
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Binding var countTimer: CountTimer
    @StateObject private var whatch = Whatch()
    @State private var canSend: CountTimerStateEnum = .wait
    
    let callBack: () -> Void
    
    public var body: some View {
        VStack(content: {
            HStack(content: {
                Text(canSend.title)
                    .onTapGesture {
                        if canSend == .send {
                            canSend = .wait
                            countTimer.expired = 0
                            callBack()
                        }
                    }
                
                if (canSend == .wait) { clockView() }
            })
            .foregroundColor(canSend.foregroundColor)
            .font(.system(size: 14))
            .multilineTextAlignment(.leading)
            .frame(width: getWidth() - 40, height: 30, alignment: .center)
        })
        .onChange(of: whatch.isActive, perform: { newValue in
            whatch.isActive == true ? (canSend = .wait) : (canSend = .send)
        })
        .onChange(of: countTimer.expired) { newValue in
            whatch.start(minutes: Float(countTimer.expired/60))
        }
        .onAppear {
            whatch.start(minutes: Float(countTimer.expired/60))
        }
        .onReceive(timer) { _ in
            whatch.updateCountdown()
        }
    }
      
    private func clockView() -> some View { 
        Text(whatch.time)
            .onChange(of: whatch.minutes, perform: { input in
                if whatch.minutes == 0 {
                    self.canSend = .send
                }
            })
    }
    
    private func getHours(sec: Int) -> String {
        let getHours = (sec / 3600)
        return "\(getHours)"
    }

    private func getMinuts(sec: Int) -> String {
        let getMin = (sec % 3600) / 60
        return sec <= 3600 ? "0\(getMin)" : "\(getMin)"
    }

    private func getSec(sec: Int) -> String {
        let getMin = (sec / 60)
        let getSec = sec - (getMin * 60)
        return getSec < 10 ? "0\(getSec)" : "\(getSec)"
    }
}

struct AuthTimer_Previews: PreviewProvider {
    static var previews: some View {
        AuthTimer(countTimer: .constant(CountTimer(canSend: .wait, canSendCount: 3, expired: 60))){ }
    }
}

public enum CountTimerStateEnum {
    case wait, blocked, send
    
    public var title: String {
        switch self {
        case .wait: return TitleObject.Timer.wait.rawValue
        case .blocked: return TitleObject.Timer.wait.rawValue
        case .send: return TitleObject.Timer.send.rawValue
        }
    }
    
    public var foregroundColor: Color {
        switch self {
        case .wait: return AppColor.AppGray.color.opacity(0.6)
        case .blocked: return AppColor.AppGray.color.opacity(0.6)
        case .send: return AppColor.AppBlue.color
        }
    }
}

final class Whatch: ObservableObject {
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
