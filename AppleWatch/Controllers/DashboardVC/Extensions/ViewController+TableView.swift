//
//  ViewController+TableView.swift
//  AppleWatch
//
//  Created by Shashikant's Mac on 8/22/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit

// MARK:- Extension for UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrResults.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListingCell.self), for: indexPath) as? ListingCell else { return UITableViewCell() }
        if arrResults.count > indexPath.row {
            let str = "\(indexPath.row)) " + "\(arrResults[indexPath.row])"
            cell.setUpData(strData: str)
        }
        return cell
    }
} //extension

// MARK:- Extension for UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            sendResponseToWatch(types: [.steps])
        case 1:
            sendResponseToWatch(types: [.heartBeats])
        case 2:
            sendResponseToWatch(types: [.gyroscope])
        case 3:
            sendResponseToWatch(types: [.accelerometer])
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
} //extension
