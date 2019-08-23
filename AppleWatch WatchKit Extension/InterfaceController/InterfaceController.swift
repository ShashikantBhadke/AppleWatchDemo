//
//  InterfaceController.swift
//  AppleWatch WatchKit Extension
//
//  Created by Shashikant's Mac on 8/22/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import WatchKit
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    // MARK:- Outlets
    @IBOutlet private weak var lblMsg               : WKInterfaceLabel!
    @IBOutlet private weak var btnSteps             : WKInterfaceButton!
    @IBOutlet private weak var btnHeartBeats        : WKInterfaceButton!
    @IBOutlet private weak var btnGyroscope         : WKInterfaceButton!
    @IBOutlet private weak var btnAccelerometer     : WKInterfaceButton!
    
    // MARK:- Variables
    var strMessage = "" {
        didSet {
            lblMsg.setText(strMessage.capitalized)
        }
    }
    var watchSession: WCSession?
    
    // MARK:- Default Methods
    ///Configure interface objects here.
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    /// This method is called when watch view controller is about to be visible to user
    override func willActivate() {
        super.willActivate()
        setCurrentState(status: false)
        setUpWatchConnectivity()
    }
    /// This method is called when watch view controller is no longer visible
    override func didDeactivate() {
        super.didDeactivate()
    }

    // MARK:- SetUpWatchConnectivity
    private func setUpWatchConnectivity() {
        if (WCSession.isSupported()) {
            watchSession = WCSession.default
            watchSession?.delegate = self
            watchSession?.activate()
        }
    }
    
    // MARK:- Button Actions
    @IBAction func btnStepsPressed() {
        sendResponseToPhone(types: [.steps])
    }
    @IBAction func btnHeartBeatsPressed() {
        sendResponseToPhone(types: [.heartBeats])
    }
    @IBAction func btnGyroscopePressed() {
        sendResponseToPhone(types: [.gyroscope])
    }
    @IBAction func btnAccelerometerPressed() {
        sendResponseToPhone(types: [.accelerometer])
    }
    
    // MARK:- Custom Methods
    private func sendResponseToPhone(types: Set<ParamaterType>) {
        let parameters = Constant.getParameterFor(type: types)
        watchSession?.sendMessage(parameters, replyHandler: { (res) in
            debugPrint(res)
        }, errorHandler: { (error) in
            debugPrint(error.localizedDescription)
        })
    }
    
    func setCurrentState(status: Bool) {
        DispatchQueue.main.async {
            self.lblMsg.setTextColor(status ? UIColor.green : UIColor.lightGray)
        }
    }
} // class
