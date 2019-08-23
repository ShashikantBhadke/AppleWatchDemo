//
//  ViewController+WatchKitDelegate.swift
//  AppleWatch
//
//  Created by Shashikant's Mac on 8/22/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit
import WatchConnectivity

// MARK:- Extension for WCSessionDelegate
extension ViewController: WCSessionDelegate {
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        if let keyValue = message["key"] as? String {
            arrResults.append(keyValue)
        }
        let response = Constant.getAcknowledge(sender: .iPhone, receiver: .Watch)
        replyHandler(response)
    }
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        print("Data dictionary is received successfully.")
    }
    
    func session(_ session: WCSession, didReceive file: WCSessionFile) {
        print("File is received successfully.")
    }    
    
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
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        debugPrint("Session prepares to stop communicating with the current Apple Watch.")
        setCurrentState(status: false)
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        debugPrint("Communication with the Apple Watch has ended.")
        setCurrentState(status: false)
    }
} //extension
