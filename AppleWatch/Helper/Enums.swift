//
//  Enums.swift
//  AppleWatch
//
//  Created by Shashikant's Mac on 8/23/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import Foundation

/// NOTE: This File is used by both Watch and iPhone as well

enum ParameterKeys: String {
    case Key        = "key"
    case Status     = "status"
    case Sender     = "currentDevice"
    case Receiver   = "receiverDevice"
}

enum ParamaterType {
    case steps, heartBeats, accelerometer, gyroscope
}

enum DeviceType {
    case iPhone, Watch
}
