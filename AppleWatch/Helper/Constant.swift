//
//  Constant.swift
//  AppleWatch
//
//  Created by Shashikant's Mac on 8/23/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import Foundation

/// NOTE: This File is used by both Watch and iPhone as well

class Constant {
    /// Create Parameters to send watch and ger data
    static func getParameterFor(type: Set<ParamaterType>)-> [String: String] {
        var parameters = [String: String]()
        var strKeys = ""
        for subType in type {
            if !strKeys.isEmpty {
                strKeys += ","
            }
            strKeys += "\(subType)"
        }
        parameters[ParameterKeys.Key.rawValue] = strKeys
        return parameters
    }
    
    static func getAcknowledge(sender: DeviceType, receiver: DeviceType) -> [String: Any] {
        var parameters = [String: Any]()
        parameters[ParameterKeys.Status.rawValue] = true
        parameters[ParameterKeys.Sender.rawValue] = "\(sender)"
        parameters[ParameterKeys.Receiver.rawValue] = "\(receiver)"
        return parameters
    }
} //class
