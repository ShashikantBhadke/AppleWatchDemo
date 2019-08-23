//
//  ListingCell.swift
//  AppleWatch
//
//  Created by Shashikant's Mac on 8/22/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit

class ListingCell: UITableViewCell {

    // MARK:- Outlets
    @IBOutlet private weak var lblTitle: UILabel!
    
    // MARK:- Dafault Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    override func prepareForReuse() {
        lblTitle.text = ""
    }
    
    // MARK:- Custom Methods
    func setUpData(strData: String) {
        lblTitle.text = strData.capitalized
    }
    
} //class
