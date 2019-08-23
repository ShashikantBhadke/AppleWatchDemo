//
//  InterfaceController+WatchConnectivity.swift
//  AppleWatch WatchKit Extension
//
//  Created by Shashikant's Mac on 8/23/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import WatchKit
import WatchConnectivity

// MARK:- Extension for UITextFieldDelegate
extension InterfaceController: WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        switch activationState {
        case .activated:
            setCurrentState(status: true)
            debugPrint("Communication with the counterpart app is possible.")
        case .inactive:
            setCurrentState(status: false)
            debugPrint("Counterpart app is inactive.")
        case .notActivated:
            setCurrentState(status: false)
            debugPrint("Counterpart app is not activated.")
        @unknown default:
            assertionFailure()
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        debugPrint(message)
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        if let keyValue = message["key"] as? String {
            self.strMessage = keyValue
        }
        let response = Constant.getAcknowledge(sender: .Watch, receiver: .iPhone)
        replyHandler(response)
    }
} //extension
