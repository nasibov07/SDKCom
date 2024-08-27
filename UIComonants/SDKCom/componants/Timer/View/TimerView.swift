//
//  TimerView.swift
//  BaritshkaClient
//
//  Created by Ровшан Насибов on 31.03.2024.
//

import SwiftUI

public struct AuthTimer: View {
    public typealias CallBackBlock = () -> Void
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Binding public var countTimer: CountTimer
    @StateObject private var watch = Watch()
    
    public let callBack: CallBackBlock
//    
//    public init(countTimer: Binding<CountTimer>, callBack: @escaping CallBackBlock) {
//        self._countTimer = countTimer
//        self.callBack = callBack
//    }
    
    public var body: some View {
        VStack {
            HStack {
                Text(countTimer.canSend.title)
                    .onTapGesture {
                        if countTimer.canSend == .send {
                            countTimer.canSend = .wait
                            callBack()
                        }
                    }
                
                if countTimer.canSend == .wait {
					clockView()
                }
            }
            .foregroundStyle(countTimer.canSend.foregroundColor)
            .font(.system(size: 14))
            .multilineTextAlignment(.leading)
            .frame(width: getWidth() - 40, height: 30, alignment: .center)
        }
        .onChange(of: watch.isActive) { newValue in
			countTimer.canSend = watch.isActive ? .wait : .send
        }
        .onChange(of: countTimer.canSend) { newValue in
            guard countTimer.canSend == .wait else { return }
            watch.start(minutes: Float(countTimer.expired/60))
        }
        .onAppear {
            watch.start(minutes: Float(countTimer.expired/60))
        }
        .onReceive(timer) { _ in
            watch.updateCountdown()
        }
//        .onChange(of: watch.minutes, perform: { input in
//            if watch.minutes == 0 {
//                self.countTimer.canSend = .send
//            }
//        })
    }
	
	private func clockView() -> some View {
		Text(watch.time)
			.onChange(of: watch.minutes) { input in
				if watch.minutes == 0 {
					countTimer.canSend = .send
				}
			}
	}
    
    private func getHours(sec: Int) -> String {
        let getHours = (sec / 3600)
		return getHours.formatted()
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
        AuthTimer(countTimer: .constant(.init(canSend: .blocked, canSendCount: 3, expired: 60))) {
            print("click")
        }
    }
}
