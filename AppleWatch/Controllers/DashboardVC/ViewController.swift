//
//  ViewController.swift
//  AppleWatch
//
//  Created by Shashikant's Mac on 8/22/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK:- Variables
    var arrResults = ["\(ParamaterType.steps)", "\(ParamaterType.heartBeats)", "\(ParamaterType.gyroscope)", "\(ParamaterType.accelerometer)"] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.selectRow(at: IndexPath(row: (self.arrResults.count - 1), section: 0), animated: true, scrollPosition: .bottom)
            }
        }
    }
    var watchSession: WCSession?
    
    // MARK:- ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        tableView.delegate = self
        tableView.dataSource = self
        setUpNavigation()
        setCurrentState(status: false)
        setUpAndStartSession()
    }
    private func setUpNavigation() {
        let rightBar = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(btnRefreshPressed(_ :)))
        self.navigationItem.rightBarButtonItem = rightBar
    }
    /// WatchKit Methods
    private func setUpAndStartSession() {
        if (WCSession.isSupported()) {
            watchSession = WCSession.default
            watchSession?.delegate = self
            watchSession?.activate()
        }
    }
    
    // MARK:- Button Actions
    @objc private func btnRefreshPressed(_ sender: UIBarButtonItem) {
        sendResponseToWatch(types: [.accelerometer, .gyroscope])
    }
    
    // MARK:- API Calls
    func sendResponseToWatch(types: Set<ParamaterType>) {
        let parameters = Constant.getParameterFor(type: types)
        watchSession?.sendMessage(parameters, replyHandler: { (res) in
            debugPrint(res)
        }, errorHandler: { (error) in
            debugPrint(error.localizedDescription)
        })
    }
    
    // MARK:- Custom Method
    func setCurrentState(status: Bool) {
        DispatchQueue.main.async {
            self.navigationItem.rightBarButtonItem?.tintColor = status ? UIColor.green : UIColor.lightGray
        }
    }
    
    // MARK:- Receive Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        debugPrint("Receive Memory Warning in \(String(describing: self))")
    }
    
    // MARK:- Deinit
    deinit {
        debugPrint("\(String(describing: self)) controller removed...")
    }
} //class
